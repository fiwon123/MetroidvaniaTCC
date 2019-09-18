extends "res://Scripts/StateMachine/State/State.gd"

var direction = Vector2(-1, 0)

# need implemantation
func update(body, delta):
	body.sprite.play("run")
	
	direction = Global.player.global_position - body.global_position
	print(direction)
	
	if direction.x > 0:	
		body.sprite.flip_h = true
	else:
		body.sprite.flip_h = false
		
	direction.y = 0;
		
	body.move_and_slide(direction.normalized() * body.stats.speed, body.UP)