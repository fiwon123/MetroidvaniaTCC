extends Node2D
 # Replace with function body.

func body_entered(body, part):
	if body.is_in_group("Player"):
		get_parent().body_entered(body, part)
		
func body_exited(body, part):
	if body.is_in_group("Player"):
		get_parent().body_exited(body, part)