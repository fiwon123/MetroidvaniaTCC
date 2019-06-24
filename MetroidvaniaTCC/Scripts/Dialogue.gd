extends Polygon2D

var dialog = ["Herói: O que está acontecendo...", 
				"Herói: Não me lembro de nada...", 
				"Herói: Este lugar é escuro e estou apenas com minha espada"]
var page = 0

var is_finish = false

onready var text = $RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.dialogue = self
	text.set_bbcode(dialog[page])
	text.visible_characters = 0

func _input(event):
	if event is InputEventMouseButton && event.is_pressed():
		if text.visible_characters > text.get_total_character_count() and not is_finish:
			if page < dialog.size()-1:
				page += 1
				text.set_bbcode(dialog[page])
				text.visible_characters = 0
			else:
				is_finish = true
				Global.game.dialog_finish()

func _on_Timer_timeout():
	text.visible_characters = text.visible_characters + 1 