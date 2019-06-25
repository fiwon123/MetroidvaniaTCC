extends "res://Scripts/Item/Item.gd"

func _on_JumpPowerUp_body_entered(body):
	if body.is_in_group("Player"):
		body.max_jump = 2
		queue_free()
