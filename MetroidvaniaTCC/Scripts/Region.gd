extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func body_entered(body, part):
	if body.is_in_group("Player"):
		Global.Camera2D.limit_left = part.minX
		Global.Camera2D.limit_top = part.minY
		Global.Camera2D.limit_right = part.maxX
		Global.Camera2D.limit_bottom = part.maxY