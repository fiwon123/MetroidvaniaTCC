extends KinematicBody2D

export(int) var GRAVITY = 3600
export(int) var SPEED = 200
export(int) var JUMP_SPEED = -600

onready var sprite = $AnimatedSprite
onready var audio = $AudioStreamPlayer

const UP = Vector2(0, -1)

var state_machine = {}

func _ready():
	for state in $StateMachine.get_children():
		state_machine[state.name] = state
		

func _process(delta):
	if $StateMachine.current_state:
		var new_state = $StateMachine.current_state.update(self, delta)
		if new_state:
			change_state(new_state)
			
func change_state(state):
	var previous_state = $StateMachine.current_state
	$StateMachine.current_state = state_machine[state]
	$StateMachine.current_state.set_previous_state(previous_state)