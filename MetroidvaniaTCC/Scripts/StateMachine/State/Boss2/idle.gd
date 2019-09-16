extends "res://Scripts/StateMachine/State/State.gd"

var time = 0

# need implemantation
func update(body, delta):
	
	body.sprite.play("idle")
	
	time += delta
	if time >= 1:
		time = 0
		return "move"
