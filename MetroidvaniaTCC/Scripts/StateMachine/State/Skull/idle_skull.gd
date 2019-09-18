extends "res://Scripts/StateMachine/State/State.gd"

var motion = Vector2()
var possible_destination = []
var path = []
var destination = Vector2()

export var walk_slowdown = 0.5
export var nav_stop_treshold = 5

var index = 0

var is_started = false

var refBody;
var navigation
var available_destinations

func navigate():
	var distance_to_destination = refBody.position.distance_to(path[0])
	destination = path[0]
	
	if distance_to_destination > nav_stop_treshold:
		move()
	else:
		update_path()
	
func move():
	motion = (destination-refBody.position).normalized() * refBody.stats.speed
	
	if motion.x > 0:
		refBody.sprite.scale.x = -1
	else:
		refBody.sprite.scale.x = 1
	
	refBody.move_and_slide(motion)

func make_path():
	randomize()

	index  = randi() % possible_destination.size()
		
	var next_destination = possible_destination[index]
	
	path = navigation.get_simple_path(refBody.position, next_destination.position, false)

func update_path():
	if path.size() == 1:
		make_path()
	else:
		path.remove(0)
	
func update(body, delta):
	
	body.sprite.play("idle")
	
	if (!is_started):
		navigation = body.navigation
		available_destinations = navigation.get_child(0)
		refBody = body
		possible_destination = available_destinations.get_children()
		make_path()
		is_started = true
	
	navigate()