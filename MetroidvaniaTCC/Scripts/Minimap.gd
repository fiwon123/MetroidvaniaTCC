extends Control

var relative_position = Vector2(512, 300)
var current_position = Vector2(512, 300)

func set_position(position):
	print(position)
	if position.x - current_position.x < -300:
		current_position = position
		relative_position.x -= 16
		update()
	elif position.x - current_position.x > 300:
		current_position = position
		relative_position.x += 16
		update()
	elif position.y - current_position.y < -512:
		current_position = position
		relative_position.y -= 16
		update()
	elif position.y - current_position.y > 512:
		current_position = position
		relative_position.y += 16
		update()

func _draw():
	draw_rect(Rect2(relative_position, Vector2(16,16)), Color.red)