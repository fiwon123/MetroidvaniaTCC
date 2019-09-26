extends "res://Scripts/StateMachine/State/State.gd"

var sound = "res://SFX/Boss2/Attack.ogg"

# Called when the node enters the scene tree for the first time.
func update(body, delta):
	body.sprite.play("prepare_attack")
	body.audio.stream = load(sound)
	body.audio.play()

