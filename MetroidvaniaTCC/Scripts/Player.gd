extends "res://Scripts/Character.gd"

var ATTACK = 0

var motion = Vector2(0, 0)

var is_attacking = false
var is_jumping = false
var is_hurt = false

var max_jump = 2
var times_jump = 0

const walk_sound = ["res://SFX/Step-3.wav"]
const sword_sound = ["res://SFX/Sword-1.wav"]

func _process(delta):
	fall(delta)
	
	if stats.hp > 0:
		move()
		jump()
		attack()
		update_GUI()
	else:
		sprite.play("die")
		motion.x = 0
		
	move_and_slide(motion, UP)

func update_GUI():
	Global.GUI.set_hp(stats.hp)
	
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
		if not is_attacking and not is_hurt:
			sprite.play("jump")
		motion.y = stats.jump
		is_jumping = true

func move():
	if not is_attacking and not is_jumping and not is_hurt:
		sprite.play("move")
		
	if Input.is_action_pressed("right"):
		motion.x = stats.speed + ATTACK
		sprite.flip_h = false
		if not $AudioStreamPlayer.playing and not is_jumping:
			$AudioStreamPlayer.stream = load(walk_sound[0])
			$AudioStreamPlayer.play()
	elif Input.is_action_pressed("left"):
		motion.x = -stats.speed + ATTACK
		sprite.flip_h = true
		if not $AudioStreamPlayer.playing and not is_jumping:
			$AudioStreamPlayer.stream = load(walk_sound[0])
			$AudioStreamPlayer.play()
	else:  
		if not is_attacking and not is_jumping and not is_hurt:
			sprite.play("idle")
		motion.x = 0

func attack():
	if Input.is_action_just_pressed("attack") and not is_attacking and not is_hurt:
		sprite.play("attack")
		$AudioStreamPlayer.stream = load(sword_sound[0])
		$AudioStreamPlayer.play()
		is_attacking = true

func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "attack":
		is_attacking = false
		sprite.play("jump")
	if sprite.animation == "hurt":
		is_hurt = false
	




func _on_DetectBody_area_entered(area):
	is_attacking = false
	sprite.stop()
	sprite.play("hurt")
	if not sprite.flip_h:
		motion.x = -1000
		motion.y = -350
	else:
		motion.x = 1000
		motion.y = -350
	move_and_slide(motion, UP)
	is_hurt = true
	stats.hp -= 10
