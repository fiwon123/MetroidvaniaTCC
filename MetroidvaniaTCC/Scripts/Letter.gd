extends "res://Scripts/Trigger.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	dialogue = [["forest-2-1", "forest-2-2", "forest-2-3", "forest-2-4"]]



func _on_Letter_body_entered(body):
	var tween = get_node("Tween")
	tween.interpolate_property($buttonZ, "modulate",
        $buttonZ.modulate, Color(1, 1, 1, 1), 0.5,
        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()


func _on_Letter_body_exited(body):
	var tween = get_node("Tween")
	tween.interpolate_property($buttonZ, "modulate",
        $buttonZ.modulate, Color(1, 1, 1, 0), 0.5,
        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
