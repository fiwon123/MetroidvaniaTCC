extends "res://Scripts/Item/Item.gd"


func _on_Life_body_entered(body):
	if body.is_in_group("Player"):
		body.recover_life(10)
		$CollisionShape2D.call_deferred("set_disabled", true)
		$Sprite.visible = false
		$AudioStreamPlayer.play()
		


func _on_AudioStreamPlayer_finished():
	queue_free()
