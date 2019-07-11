extends StaticBody2D


func _on_Area2D_body_entered(body):
	visible = true


func _on_Area2D_body_exited(body):
	visible = false
