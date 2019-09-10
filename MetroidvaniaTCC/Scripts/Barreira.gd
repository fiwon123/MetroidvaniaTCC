extends StaticBody2D

var is_disappear = false
export(bool) var need_attack = false 

func _ready():
	var tween = get_node("Tween")
	tween.interpolate_property($Sprite, "modulate",
        $Sprite.modulate, Color(1, 1, 1, 0), 0.5,
        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func start_disappear():
	$Area2D.queue_free()
	$Area2D2.queue_free()
	$CollisionShape2D.queue_free()
	$Sprite.queue_free()
	is_disappear = true
	


func _on_Area2D_body_entered(body):
	var tween = get_node("Tween")
	tween.interpolate_property($Sprite, "modulate",
        $Sprite.modulate, Color(1, 1, 1, 1), 0.5,
        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()


func _on_Area2D_body_exited(body):
	var tween = get_node("Tween")
	tween.interpolate_property($Sprite, "modulate",
        $Sprite.modulate, Color(1, 1, 1, 0), 0.5,
        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()


func _on_Area2D2_area_entered(area):
	if need_attack and area.is_in_group("attack"):
		if area.get_parent().get_parent().have_new_attack: 
			start_disappear()
