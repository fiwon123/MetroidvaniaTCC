extends Area2D

var lever_activated = "res://GFX/Lever/down.png"
var is_interact = false; 

func _input(event):
	if Input.is_action_just_pressed("dialogue") and is_interact:
		if !get_parent().is_disappear:
			get_parent().start_disappear()
			if $Sprite.texture != load("res://GFX/Lever/down.png"):
				$Sprite.texture = load("res://GFX/Lever/down.png")
		

func _on_Lever_body_entered(body):
	if !get_parent().is_disappear:
		var tween = get_node("Tween")
		tween.interpolate_property($buttonZ, "modulate",
	        $buttonZ.modulate, Color(1, 1, 1, 1), 0.5,
	        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		is_interact = true


func _on_Lever_body_exited(body):
	var tween = get_node("Tween")
	tween.interpolate_property($buttonZ, "modulate",
        $buttonZ.modulate, Color(1, 1, 1, 0), 0.5,
        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	is_interact = false
