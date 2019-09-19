extends "res://Scripts/Monster.gd"

onready var skill = load("res://Scenes/Item/JumpPowerUp.tscn")

onready var animation = $AnimationPlayer
onready var detect = $CollisionShape2D

func _ready():
	Global.boss1 = self

func start_battle():
		change_state("idle")
		$AnimationPlayer.play("appear")

func _on_DetectBody_area_entered(area):
	if area.is_in_group("attack"):
		change_state("hit")


func _on_AnimatedSprite_animation_finished():
	if (sprite.animation == "die"):
		var drop = skill.instance()
		drop.position = position
		get_parent().add_child(drop)
		Global.is_trigger3 = true
		Global.is_defeat_boss1 = true
		queue_free()
