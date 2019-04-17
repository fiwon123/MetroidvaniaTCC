extends "res://Scripts/StateMachine/State/State.gd"

var finished

func update(body, delta):
	if not finished:
		body.sprite.play("attack")
	else:
		finished = false
		return previous_state.name
		
func _on_AnimatedSprite_animation_finished():
	if  get_parent().current_state == self:
		finished = true