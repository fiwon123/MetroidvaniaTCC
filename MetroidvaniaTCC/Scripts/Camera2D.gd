extends Camera2D

onready var anim = $AnimationPlayer

func _ready():
	Global.Camera2D = self
	
func shake():
	anim.play("shake")