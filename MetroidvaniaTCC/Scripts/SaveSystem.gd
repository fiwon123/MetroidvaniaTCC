extends Area2D

func _on_SaveSystem_area_entered(area):
	if area.is_in_group("attack"):
		$AnimatedSprite.play("activate")
		Global.save_position = Global.player.global_position
		$Timer.start()


func _on_Timer_timeout():
	$AnimatedSprite.play("deactivate")
