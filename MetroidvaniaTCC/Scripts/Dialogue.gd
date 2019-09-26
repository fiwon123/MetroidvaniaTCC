extends Polygon2D

var dialogue = []

var page = 0

var is_finish = false

onready var text = $RichTextLabel

func _ready():
	Global.dialogue = self

func start(dialogue):
	self.dialogue = dialogue
	self.visible = true
	page = 0
	is_finish = false
	text.visible_characters = 0
	text.set_bbcode(tr(dialogue[page]))
	$Timer.start()

func _input(event):
	if Input.is_action_just_pressed("dialogue"):
		if text.visible_characters >= text.get_total_character_count() and not is_finish:
			if page < dialogue.size()-1:
				page += 1
				text.set_bbcode(tr(dialogue[page]))
				text.visible_characters = 0
			else:
				is_finish = true
				self.visible = false
				Global.game.dialog_finish()

func _on_Timer_timeout():
	if (text.visible_characters < text.get_total_character_count()):
		text.visible_characters = text.visible_characters + 1 
		if (text.text[text.visible_characters-1] != " "):
			$AudioStreamPlayer.stop()
			$AudioStreamPlayer.play()
		