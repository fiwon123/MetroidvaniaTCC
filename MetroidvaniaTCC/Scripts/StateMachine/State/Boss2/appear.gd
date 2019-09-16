extends "res://Scripts/StateMachine/State/State.gd"

var rng = RandomNumberGenerator.new()

var started  = false

# Called when the node enters the scene tree for the first time.
func update(body, delta):
	if !started:
		body.sprite.play("appear")
		
		rng.randomize()
		
		var my_random_number_x = rng.randf_range(Global.player.position.x-100, Global.player.position.x+100)
		var my_random_number_y = rng.randf_range(Global.player.position.y-100, Global.player.position.y+100)
		
		body.position = Vector2(my_random_number_x, my_random_number_y)
		
		started = true



func _on_AnimatedSprite_animation_finished():
	started = false
