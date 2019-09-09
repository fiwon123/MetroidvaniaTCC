extends "res://Scripts/Monster.gd"

onready var life = load("res://Scenes/Item/Usable/Life.tscn")

onready var animation = $AnimationPlayer
onready var detect = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	change_state("idle")

func _on_DetectBody_area_entered(area):
	if area.is_in_group("attack"):
		change_state("hit")


func _on_AnimatedSprite_animation_finished():
	if (sprite.animation == "die"):
		var drop = life.instance()
		drop.position = position
		get_parent().add_child(drop)
		queue_free()
