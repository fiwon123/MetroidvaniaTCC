extends "res://Scripts/StateMachine/State/State.gd"

var direction = Vector2(-1, 0)

# need implemantation
func update(body, delta):
	
	direction.x = Global.player.global_position.x - body.global_position.x

	if direction.x <  0 and not body.is_left:
		body.is_left = true
		body.scale.x = -1
	elif direction.x > 0 and body.is_left:
		body.is_left = false
		body.scale.x = -1
		
	body.sprite.play("run")
		
	direction.y = 0
	
	body.move_and_slide(direction.normalized() * body.stats.speed, body.UP)