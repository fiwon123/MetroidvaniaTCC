extends CanvasLayer

onready var hp_bar = $TextureProgress
onready var message = $Message

func _ready():
	Global.GUI = self
	
func _process(delta):
	if Input.is_action_just_pressed("esc"):
		$PanelMenu.visible = !$PanelMenu.visible
		
func set_hp(hp):
	hp_bar.value = hp
	
func set_message(text):
	message.text = text
	
func show_message():
	$AudioStreamPlayer.play()
	$AnimationPlayer.play("show_message")
	

func _on_ButtonResume_button_down():
	$PanelMenu.visible = false


func _on_ButtonExit_button_down():
	get_tree().change_scene("res://Scenes/Screens/MainMenu.tscn")