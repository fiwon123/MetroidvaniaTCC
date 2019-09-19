extends "res://Scripts/Trigger.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if (Global.is_trigger1):
		queue_free()
	
	dialogue = [["forest-1-1", "forest-1-2", "forest-1-3", "forest-1-4"], 
				["forest-1-5", "forest-1-6", "forest-1-7"],
				["forest-1-8", "forest-1-9"]]

func _on_TriggerBegin_body_entered(body):
	Global.is_trigger1 = true
