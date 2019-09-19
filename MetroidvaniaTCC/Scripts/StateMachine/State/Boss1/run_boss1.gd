extends "res://Scripts/StateMachine/State/State.gd"

var direction = Vector2(-1, 0)

var goal_position_x = null
var distance

var time = 0

var is_left = true

# need implemantation
func update(body, delta):
	
	time += delta
	
	if goal_position_x == null:
		goal_position_x = Global.player.position.x
		direction.x = Global.player.position.x - body.position.x
		direction = direction.normalized()
		if direction.x == -1 and not is_left:
			is_left = true
			body.scale.x = -1
		elif direction.x == 1 and is_left:
			is_left = false
			body.scale.x = -1
	
	distance = abs(body.position.x - goal_position_x)
	
	body.sprite.play("run")

	body.move_and_slide(direction * body.stats.speed, body.UP)
	if distance < 20 or time > 3:
		time = 0
		goal_position_x = null
		return "idle"