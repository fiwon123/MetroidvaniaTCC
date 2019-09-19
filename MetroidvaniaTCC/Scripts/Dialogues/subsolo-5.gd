extends "res://Scripts/Trigger.gd"

func _ready():
	
	if (Global.is_trigger4):
		queue_free()
	
	dialogue = [["subsolo-5-1"]]


func _on_TriggerJump_body_entered(body):
	Global.is_trigger4 = true
