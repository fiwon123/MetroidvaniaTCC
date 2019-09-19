extends "res://Scripts/Monster.gd"

onready var life = load("res://Scenes/Item/Usable/Life.tscn")

onready var animation = $AnimationPlayer
onready var animationHit = $AnimationPlayer2
onready var detect = $CollisionShape2D

var direction = Vector3()

var is_left = false

# Called when the node enters the scene tree for the first time.
func _ready():
	change_state("idle")

func _process(delta):
	direction = Global.player.global_position - global_position
	
	direction = direction.normalized()
	if direction.x < 0 and not is_left:
		is_left = true
		scale.x = 1
	elif direction.x > 0 and is_left:
		is_left = false
		scale.x = -1

func _on_DetectBody_area_entered(area):
	if area.is_in_group("attack"):
		change_state("hit")


func _on_AnimatedSprite_animation_finished():
	if (sprite.animation == "die"):
		var drop = life.instance()
		drop.position = position
		get_parent().add_child(drop)
		queue_free()
	elif (sprite.animation == "attack"):
		change_state("idle")