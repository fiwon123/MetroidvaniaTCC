extends "res://Scripts/Monster.gd"


onready var life = load("res://Scenes/Item/Usable/Life.tscn")

onready var animation = $AnimationPlayer
onready var detect = $CollisionShape2D

onready var navigation = get_parent().find_node("Navigation2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	change_state("idle")
	
func _on_DetectBody_area_entered(area):
	if area.is_in_group("attack") and $Stats.hp > 0:
		change_state("hit")


func _on_AnimatedSprite_animation_finished():
	if (sprite.animation == "die"):
		var drop = life.instance()
		drop.position = position
		get_parent().add_child(drop)
		queue_free()

func _on_DetectEnemy_body_entered(body):
	if (body.is_in_group("Player")) and $Stats.hp > 0:
		change_state("attack")
		$Timer.stop()


func _on_DetectEnemy_body_exited(body):
	if (body.is_in_group("Player")):
		$Timer.start()


func _on_Timer_timeout():
	if $Stats.hp > 0:	
		change_state("idle")
