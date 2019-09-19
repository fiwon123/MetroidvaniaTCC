extends "res://Scripts/Trigger.gd"

var body_ref = null
var take_new_attack = false

func _ready():
	dialogue = [["vila-9-1", "vila-9-2", "vila-9-3", "vila-9-4", "vila-9-5", "vila-9-6", "vila-9-7", "vila-9-8", "vila-9-9", "vila-9-10"]]

func _process(delta):
	if Input.is_action_just_pressed("dialogue") and is_interact and is_need_interact:
		if body_ref != null and !take_new_attack:
			body_ref.have_new_attack = true
			take_new_attack = true
			Global.GUI.set_message("Habilidade Nova\nSua espada pode quebrar Algumas barreiras")

func _on_OldMan_body_entered(body):
	var tween = get_node("Tween")
	tween.interpolate_property($ButtonZ, "modulate",
        $ButtonZ.modulate, Color(1, 1, 1, 1), 0.5,
        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	body_ref = body


func _on_OldMan_body_exited(body):
	var tween = get_node("Tween")
	tween.interpolate_property($ButtonZ, "modulate",
        $ButtonZ.modulate, Color(1, 1, 1, 0), 0.5,
        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	body_ref = null
