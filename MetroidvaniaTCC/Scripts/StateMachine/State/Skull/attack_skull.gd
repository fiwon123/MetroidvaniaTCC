extends "res://Scripts/StateMachine/State/State.gd"

var time = 0
var direction = Vector2(-1, 0)

# need implemantation
func update(body, delta):
	time += delta
	body.sprite.play("attack")
	
	direction = Global.player.global_position - body.global_position

	if direction.x > 0:	
		body.sprite.scale.x = -1
	else:
		body.sprite.scale.x = 1
		
	body.move_and_slide(direction.normalized() * body.stats.speed, body.UP)