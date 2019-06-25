extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_ButtonStart_pressed():
	get_tree().change_scene(Global.SAVES)

func _on_ButtonOptions_pressed():
	get_tree().change_scene(Global.OPTIONS)

func _on_ButtonCredits_pressed():
	get_tree().change_scene(Global.CREDITS)
	
func _on_ButtonExit_pressed():
	get_tree().quit()




