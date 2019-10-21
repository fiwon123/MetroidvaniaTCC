extends CanvasLayer

onready var hp_bar = $TextureProgress
onready var message = $Message

func _ready():
	Global.GUI = self
		
func set_hp(hp):
	hp_bar.value = hp
	
func set_message(text):
	message.text = text
	
func show_message():
	$AudioStreamPlayer.play()
	$AnimationPlayer.play("show_message")
	

