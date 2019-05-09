extends "res://Scripts/Monster.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	change_state("idle")

func _on_DetectBody_area_entered(area):
	if area.is_in_group("attack"):
		stats.hp -= 50
		if stats.hp <= 0:
			queue_free()
