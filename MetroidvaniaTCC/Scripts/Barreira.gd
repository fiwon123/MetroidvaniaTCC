extends StaticBody2D

var is_disappear = false
export(bool) var need_attack = false 

enum NamedEnum {BARREIRA_1, BARREIRA_2, BARREIRA_3, BARREIRA_4, ANOTHER_THING = -1}
export (NamedEnum) var x

func _ready():
	match (x):
		NamedEnum.BARREIRA_1:
			if (Global.is_destroy_barrier1):
				start_disappear()
		NamedEnum.BARREIRA_2:
			if (Global.is_destroy_barrier2):
				start_disappear()
		NamedEnum.BARREIRA_3:
			if (Global.is_destroy_barrier3):
				start_disappear()
		NamedEnum.BARREIRA_4:
			if (Global.is_destroy_barrier4):
				start_disappear()
		

func start_disappear():
	$Area2D.queue_free()
	$Area2D2.queue_free()
	$CollisionShape2D.queue_free()
	$Sprite.queue_free()
	is_disappear = true
	
	match (x):
		NamedEnum.BARREIRA_1:
			Global.is_destroy_barrier1 = true
		NamedEnum.BARREIRA_2:
			Global.is_destroy_barrier2 = true
		NamedEnum.BARREIRA_3:
			Global.is_destroy_barrier3 = true
		NamedEnum.BARREIRA_4:
			Global.is_destroy_barrier4 = true


func _on_Area2D2_area_entered(area):
	if area.is_in_group("attack"):
		$AudioStreamPlayer.play()
		$AnimationPlayer.stop()
		$AnimationPlayer.play("light")
		if area.get_parent().get_parent().have_new_attack and need_attack: 
			start_disappear()
