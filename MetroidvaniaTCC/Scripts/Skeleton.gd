extends "res://Scripts/Monster.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass


func _on_DetectBody_area_entered(area):
	if area.is_in_group("attack"):
		print("oi")
