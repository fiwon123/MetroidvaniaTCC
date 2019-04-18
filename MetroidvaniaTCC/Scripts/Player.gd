extends "res://Scripts/Character.gd"

var ATTACK = 0

var motion = Vector2(0, 0)

var is_attacking = false
var is_jumping = false

var max_jump = 2
var times_jump = 0

func _process(delta):
	fall(delta)
	move()
	jump()
	attack()
	move_and_slide(motion, UP)


func fall(delta):
	if is_on_floor():
		times_jump = max_jump
		motion.y = 0
		is_jumping = false
	if is_on_ceiling():
		motion.y += GRAVITY* 3 * delta
		is_jumping = false

	motion.y += GRAVITY * delta

func jump():
	if Input.is_action_just_pressed("jump") and times_jump > 0:
		times_jump -= 1
		sprite.play("jump")
		motion.y = stats.jump
		is_jumping = true

func move():
	if not is_attacking and not is_jumping:
		sprite.play("move")
	if Input.is_action_pressed("right"):
		motion.x = stats.speed + ATTACK
		sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		motion.x = -stats.speed + ATTACK
		sprite.flip_h = true
	else:  
		if not is_attacking and not is_jumping:
			sprite.play("idle")
		motion.x = 0

func attack():
	if Input.is_action_just_pressed("attack"):
		sprite.play("attack")
		is_attacking = true

func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "attack":
		is_attacking = false
		sprite.play("jump")
