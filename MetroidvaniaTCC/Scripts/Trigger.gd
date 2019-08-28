extends Area2D

#Config Animation
export (String, "cena1", "cena2", "cena3", "cena4", "cena5", "cena6", "cena7", "cena8", "cena9", "cena10") var cena

export (bool) var is_need_destroy = true

#Config interact
export (bool) var is_need_interact
var is_interact

#Config Dialogue
var dialogue = []
var is_start = false

func _process(delta):
	if Input.is_action_just_pressed("dialogue") and is_interact and is_need_interact:
		start_animation()

func _on_Trigger_body_entered(body):
	if not is_start:
		if not is_need_interact:
			start_animation()
		
		is_interact = true
			
func start_animation():
	Global.game.start_animation(cena, dialogue)
	is_start = true
	if (is_need_destroy):
		queue_free()
		
	

func _on_Trigger_body_exited(body):
	is_interact = false

