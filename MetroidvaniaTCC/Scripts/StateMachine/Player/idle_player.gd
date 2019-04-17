extends "res://Scripts/StateMachine/State/State.gd"

func update(body, delta):
	body.motion.x = 0
	body.sprite.play("idle")
