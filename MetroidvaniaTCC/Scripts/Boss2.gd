extends "res://Scripts/Monster.gd"

onready var animation = $AnimationPlayer
onready var detect = $CollisionShape2D
	
func start_battle():
	change_state("appear")

func _on_DetectBody_area_entered(area):
	if area.is_in_group("attack"):
		change_state("hit")
	

func _on_AnimatedSprite_animation_finished():
	if (sprite.animation == "die"):
		queue_free()
		get_tree().change_scene(Global.FINAL)
	elif (sprite.animation == "appear"):
		change_state("move")
	elif (sprite.animation == "prepare_attack"):
		change_state("attacking")
	elif (sprite.animation == "vanish"):
		change_state("appear")
