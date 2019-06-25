extends Area2D

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
		Global.dialogue.start(dialogue)
		is_start = true
