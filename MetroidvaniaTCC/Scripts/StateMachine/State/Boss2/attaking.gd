extends "res://Scripts/StateMachine/State/State.gd"

var time = 0
var direction = null

var rng = RandomNumberGenerator.new()
		
# need implemantation
func update(body, delta):
	time += delta
	body.sprite.play("attacking")
	
	if (direction == null):
		direction = Global.player.position - body.position
		if direction.x > 0:	
			body.sprite.scale.x = -2
		else:
			body.sprite.scale.x = 2
		
	body.move_and_slide(direction.normalized() * (body.stats.speed + 300.0), body.UP)
	if time >= 1:
		direction = null
		time = 0
		rng.randomize()
		var my_random_number = rng.randi_range(0, 1)
		
		if (my_random_number == 0):
			return "idle"
		else:
			return "vanish"