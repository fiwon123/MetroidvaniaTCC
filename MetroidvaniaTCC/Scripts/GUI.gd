extends CanvasLayer

onready var hp_bar = $TextureProgress
onready var message = $Message

func _ready():
	Global.GUI = self
	
func _process(delta):
	pass

func set_hp(hp):
	hp_bar.value = hp
	
func set_message(text):
	message.text = text
	
func show_message():
	$AnimationPlayer.play("show_message")