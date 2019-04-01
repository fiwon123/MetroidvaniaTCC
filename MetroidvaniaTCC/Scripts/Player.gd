extends KinematicBody2D

const GRAVITY = 3600
const SPEED = 750
const JUMP_SPEED = -1000
const UP = Vector2(0, -1)

var motion = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(is_on_floor() or is_on_ceiling()):
		motion.y = 0
	else:
		motion.y += GRAVITY * delta
	move()
	if Input.is_action_pressed("ui_accept"):
		motion.y = JUMP_SPEED
	motion.y = clamp(motion.y, JUMP_SPEED, -JUMP_SPEED)
	move_and_slide(motion, UP)

func _process(delta):
	update_animation(motion)
	
func update_animation(motion):
	$AnimatedSprite.update_animation(motion)
	
func move():
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:  
		motion.x = 0
		
		
