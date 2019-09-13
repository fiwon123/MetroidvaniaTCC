extends "res://Scripts/StateMachine/State/State.gd"


var time = 0
var direction = Vector2(-1, 0)

# need implemantation
func update(body, delta):
	time += delta
	body.sprite.play("idle")
	
	direction = Global.player.position - body.position

	if direction.x > 0:	
		body.sprite.scale.x = -2
	else:
		body.sprite.scale.x = 2
		
	body.move_and_slide(direction.normalized() * body.stats.speed, body.UP)
	if time >= 2:
		time = 0
		return "prepare_attack"