extends "res://Scripts/Trigger.gd"

func _ready():
	
	if (Global.is_trigger3 and Global.is_defeat_boss1):
		queue_free()
	
	dialogue = [["subsolo-6-1", "subsolo-6-2", "subsolo-6-3", "subsolo-6-4"]]


