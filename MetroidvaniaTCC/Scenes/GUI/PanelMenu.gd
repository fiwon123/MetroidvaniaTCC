extends Panel

func _process(delta):
	if Input.is_action_just_pressed("esc"):
		get_tree().paused = !get_tree().paused 
		visible = !visible

func _on_ButtonResume_button_down():
	visible = false
	get_tree().paused = false


func _on_ButtonExit_button_down():
	get_tree().paused = false
	Global.music.stop()
	get_tree().change_scene("res://Scenes/Screens/MainMenu.tscn")

