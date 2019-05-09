extends "res://Scripts/StateMachine/State/State.gd"

var time = 0
var direction = Vector2(-1, 0)

# need implemantation
func update(body, delta):
	time += delta
	body.sprite.play("move")
	if direction.x == -1:	
		body.sprite.flip_h = false
	else:
		body.sprite.flip_h = true
	body.move_and_slide(direction * body.stats.speed, body.UP)
	if time >= 1:
		direction.x *= -1
		time = 0
		return "idle"