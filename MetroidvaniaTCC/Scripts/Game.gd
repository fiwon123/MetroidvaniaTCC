extends Node2D

var is_stop = false

var ref_dialogue
var index = 0

func _ready():
	Global.game = self

func pause_animation():
	$AnimationCutScenes.playback_process_mode = AnimationPlayer.ANIMATION_PROCESS_MANUAL
	print($AnimationCutScenes.playback_process_mode )

func start_animation(anim, dialogue):
	$AnimationCutScenes.play("cena1")
	ref_dialogue = dialogue
	index = 0
	start_dialogue()

	is_stop = true
	
func start_dialogue():
	Global.dialogue.start(ref_dialogue[index])

func shake_camera():
	Global.Camera2D.shake()

func dialog_finish():
	index += 1
	if index < ref_dialogue.size():
		start_dialogue()

	$AnimationCutScenes.playback_process_mode = AnimationPlayer.ANIMATION_PROCESS_IDLE
	

func _on_AnimationCutScenes_animation_finished(anim_name):
	is_stop = false
