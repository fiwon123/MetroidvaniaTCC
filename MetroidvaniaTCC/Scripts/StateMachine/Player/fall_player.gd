extends "res://Scripts/StateMachine/State/State.gd"

func update(body, delta):
	if (body.is_on_floor()):
		body.motion.y = 0
		return "idle"