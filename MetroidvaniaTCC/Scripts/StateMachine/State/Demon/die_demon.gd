extends "res://Scripts/StateMachine/State/State.gd"

func update(body, delta):
	body.remove_from_group("Monster")
	body.detect.disabled = true
	body.sprite.play("die")
