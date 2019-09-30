extends Area2D

var minX
var minY
var maxX
var maxY

onready var areaSize = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	minX = global_position.x - areaSize.shape.extents.x
	minY = global_position.y - areaSize.shape.extents.y
	maxX = global_position.x + areaSize.shape.extents.x
	maxY = global_position.y + areaSize.shape.extents.y

func _on_Part_body_entered(body):
	get_parent().body_entered(body, self)


func _on_Part_body_exited(body):
	get_parent().body_exited(body, self)
