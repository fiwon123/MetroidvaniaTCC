extends "res://Scripts/Character.gd"

var ATTACK = 0

var motion = Vector2(0, 0)

func _ready():
	change_state("idle")

func _physics_process(delta):
	move()
	jump(delta)
	attack()
	fall()
	move_and_slide(motion, UP)
	if (not is_on_floor()):
		motion.y += GRAVITY * delta

func jump(delta):
	if Input.is_action_pressed("jump"):
		change_state("jump")
		sprite.play("jump")
		motion.y = JUMP_SPEED
		motion.y = clamp(motion.y, JUMP_SPEED, -JUMP_SPEED)


func fall():
	if (motion.y > 0):
		change_state("fall")

func move():
	if Input.is_action_pressed("right") or Input.is_action_pressed("left"):
		change_state("move")
		

func attack():
	if Input.is_action_just_pressed("attack"):
		change_state("attack")
