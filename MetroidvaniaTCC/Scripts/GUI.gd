extends CanvasLayer

onready var hp_bar = $TextureProgress

func _ready():
	Global.GUI = self
	
func _process(delta):
	pass

func set_hp(hp):
	hp_bar.value = hp