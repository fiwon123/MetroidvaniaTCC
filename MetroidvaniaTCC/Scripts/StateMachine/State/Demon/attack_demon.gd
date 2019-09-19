extends "res://Scripts/StateMachine/State/State.gd"


# need implemantation
func update(body, delta):
	body.sprite.play("attack")
	body.animation.play("attack")

