extends "res://Scripts/StateMachine/State/State.gd"

# need implemantation
func update(body, delta):
	body.animation.play("hit")
		
	return "idle"
