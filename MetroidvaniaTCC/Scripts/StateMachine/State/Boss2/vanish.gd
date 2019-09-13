extends "res://Scripts/StateMachine/State/State.gd"


# Called when the node enters the scene tree for the first time.
func update(body, delta):
	body.sprite.play("vanish")
