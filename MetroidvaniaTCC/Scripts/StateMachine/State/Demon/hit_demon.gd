extends "res://Scripts/StateMachine/State/State.gd"


# need implemantation
func update(body, delta):
	body.animationHit.play("hit")
	
	body.stats.hp -= 50
	
	if body.stats.hp <= 0:
		return "die"
	else:
		return "idle"
