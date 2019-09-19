extends "res://Scripts/Trigger.gd"

func _ready():
	
	if (Global.is_trigger5):
		queue_free()
	
	dialogue = [["castle-7-1", "castle-7-2"]]


func _on_TriggerCastle_body_entered(body):
	Global.is_trigger5 = true
