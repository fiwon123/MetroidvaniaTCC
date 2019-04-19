extends CanvasLayer

onready var hp_bar = $TextureProgress

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.GUI = self

func set_hp(hp):
	hp_bar.value = hp
