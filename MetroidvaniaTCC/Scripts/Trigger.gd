extends Area2D

export(String, "cena1", "cena2", "cena3") var cena

var dialogue = []
var is_start = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Trigger_body_entered(body):
	if not is_start:
		Global.game.start_animation(cena, dialogue)
		is_start = true
