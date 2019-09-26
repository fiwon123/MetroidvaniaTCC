extends "res://Scripts/StateMachine/State/State.gd"

var sound = "res://SFX/Boss2/Hurt.ogg"

# need implemantation
func update(body, delta):
	body.animation.play("hit")
	
	body.audio.stream = load(sound)
	body.audio.play()
	
	body.stats.hp -= 50
	
	if body.stats.hp <= 0:
		return "die"
	else:
		return "idle"
