extends Node2D

var area = null
var oldArea = null

func _process(delta):
	if area != null:
		Global.Camera2D.limit_left = area.minX
		Global.Camera2D.limit_top = area.minY
		Global.Camera2D.limit_right = area.maxX
		Global.Camera2D.limit_bottom = area.maxY

func body_entered(body, part):
	if body.is_in_group("Player"):
		oldArea = area
		area = part

func body_exited(body, part):
	if body.is_in_group("Player"):
		if (part == area):
			area = oldArea