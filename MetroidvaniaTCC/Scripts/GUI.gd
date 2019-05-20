extends CanvasLayer

onready var hp_bar = $TextureProgress

func _ready():
	Global.GUI = self
	
func _process(delta):
	pass

func set_hp(hp):
	hp_bar.value = hp
	
func set_minimap(position):
	$Minimap.set_position(position)

func _input(event):
	if (Input.is_action_pressed("open_minimap")):
		$Minimap.visible = true
	elif (!Input.is_action_pressed("open_minimap")):
		$Minimap.visible = false