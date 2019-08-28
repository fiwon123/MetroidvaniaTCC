extends "res://Scripts/Trigger.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	dialogue = [["forest-3-1","forest-3-2"]]


func _on_Trigger_body_entered(body):
	if get_parent().is_disappear:
		queue_free()
