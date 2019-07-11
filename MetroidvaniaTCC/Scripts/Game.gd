extends Node2D

var is_stop = false

var ref_dialogue
var index = 0

onready var anim_cutscene = $AnimationCutScenes

func _ready():
	Global.game = self

func pause_animation():
	$AnimationCutScenes.playback_process_mode = AnimationPlayer.ANIMATION_PROCESS_MANUAL

func start_animation(anim, dialogue):
	ref_dialogue = dialogue
	index = 0
	anim_cutscene.play(anim)
	print("oi")
	is_stop = true
	
func start_dialogue():
	if index < ref_dialogue.size():
		Global.dialogue.start(ref_dialogue[index])

func shake_camera():
	Global.Camera2D.shake()

func dialog_finish():
	index += 1

	$AnimationCutScenes.playback_process_mode = AnimationPlayer.ANIMATION_PROCESS_IDLE
	
func showTutorialMove():
	pass
	
func showTutorialJump():
	pass

func _on_AnimationCutScenes_animation_finished(anim_name):
	print("terminou")
	is_stop = false
