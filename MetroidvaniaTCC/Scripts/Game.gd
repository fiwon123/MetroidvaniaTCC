extends Node2D

func _ready():
	Global.game = self

func dialog_finish():
	Global.Camera2D.shake()
	$GUI/Dialogue.visible = false