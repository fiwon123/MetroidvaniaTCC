extends Area2D

export(String) var nameItem
export(String) var description

func _ready():
	$LabelName.text = nameItem
	$LabelDescription.text = description