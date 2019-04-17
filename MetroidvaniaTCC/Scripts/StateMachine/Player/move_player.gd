extends "res://Scripts/StateMachine/State/State.gd"

func update(body, delta):
	if Input.is_action_pressed("right"):
		body.motion.x = body.SPEED - body.ATTACK
		body.sprite.play("move")
		body.sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		body.motion.x = -body.SPEED + body.ATTACK
		body.sprite.play("move")
		body.sprite.flip_h = true
	else:  
		return "idle"
