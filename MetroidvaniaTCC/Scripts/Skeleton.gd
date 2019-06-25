extends "res://Scripts/Monster.gd"

onready var life = load("res://Scenes/Item/Usable/Life.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	change_state("idle")

func _on_DetectBody_area_entered(area):
	if area.is_in_group("attack"):
		stats.hp -= 50
		if stats.hp <= 0:
			var drop = life.instance()
			drop.global_position = global_position
			get_parent().add_child(drop)
			queue_free()
