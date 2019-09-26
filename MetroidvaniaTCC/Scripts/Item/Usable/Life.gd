extends "res://Scripts/Item/Item.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Life_body_entered(body):
	if body.is_in_group("Player"):
		body.recover_life(10)
		$CollisionShape2D.disabled = true
		$Sprite.visible = false
		$AudioStreamPlayer.play()
		


func _on_AudioStreamPlayer_finished():
	queue_free()
