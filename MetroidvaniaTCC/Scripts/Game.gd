extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func dialog_finish():
	Global.Camera2D.shake()
	$GUI/Dialogue.visible = false