extends "res://Scripts/Trigger.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if (Global.is_trigger2):
		queue_free()
	
	dialogue = [["subsolo-4-1"]]

func _on_TriggerSubsolo_body_entered(body):
	Global.is_trigger2 = true
