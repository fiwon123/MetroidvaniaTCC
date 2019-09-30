extends "res://Scripts/Monster.gd"

onready var life = load("res://Scenes/Item/Usable/Life.tscn")

onready var animation = $AnimationPlayer
onready var detect = $CollisionShape2D

var is_left = true

var motion = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	change_state("idle")
	
func _process(delta):
	if $StateMachine.current_state.name != "die":
		fall(delta)
	
		move_and_slide(motion, UP)
	
func fall(delta):
	
	motion.y += GRAVITY * delta
	
	if is_on_floor():
		motion.y = 0
	if is_on_ceiling():
		motion.y += GRAVITY* 3 * delta

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
	if body.is_in_group("Player")  and $Stats.hp > 0:
		change_state("run")
		$Timer.stop()


func _on_DetectEnemy_body_exited(body):
	if body.is_in_group("Player") and $Timer.is_stopped():
		$Timer.start()
			
func _on_Timer_timeout():
	if $Stats.hp > 0  and $Stats.hp > 0:	
		change_state("idle")
