extends "res://Scripts/StateMachine/State/State.gd"

func update(body, delta):
	if (body.motion.y > 0):
		return "fall"