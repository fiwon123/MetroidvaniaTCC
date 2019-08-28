extends "res://Scripts/Trigger.gd"

var body_ref = null
var take_new_attack = false

func _ready():
	dialogue = [["forest-2-1", "forest-2-2", "forest-2-3", "forest-2-4"]]

func _process(delta):
	if Input.is_action_just_pressed("dialogue") and is_interact and is_need_interact:
		if body_ref != null and !take_new_attack:
			body_ref.have_new_attack = true
			take_new_attack = true

func _on_Letter_body_entered(body):
	var tween = get_node("Tween")
	tween.interpolate_property($buttonZ, "modulate",
        $buttonZ.modulate, Color(1, 1, 1, 1), 0.5,
        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	body_ref = body


func _on_Letter_body_exited(body):
	var tween = get_node("Tween")
	tween.interpolate_property($buttonZ, "modulate",
        $buttonZ.modulate, Color(1, 1, 1, 0), 0.5,
        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	body_ref = null