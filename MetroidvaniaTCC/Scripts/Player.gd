extends "res://Scripts/Character.gd"

var ATTACK = 0

var motion = Vector2(0, 0)

var is_attacking = false

func _physics_process(delta):
	move()
	jump(delta)
	attack()
	move_and_slide(motion, UP)
	if (not is_on_floor()):
		motion.y += GRAVITY * delta
	else:
		motion.y = 0

func jump(delta):
	if Input.is_action_just_pressed("jump"):
		sprite.play("jump")
		motion.y = stats.jump

func move():
	if not is_attacking:
		sprite.play("move")
	if Input.is_action_pressed("right"):
		motion.x = stats.speed + ATTACK
		sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		motion.x = -stats.speed + ATTACK
		sprite.flip_h = true
	else:  
		if not is_attacking:
			sprite.play("idle")
		motion.x = 0

func attack():
	if Input.is_action_just_pressed("attack"):
		sprite.play("attack")
		is_attacking = true



func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "attack":
		is_attacking = false
