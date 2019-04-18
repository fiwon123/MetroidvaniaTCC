extends KinematicBody2D

onready var stats = $Stats
onready var sprite = $AnimatedSprite
onready var audio = $AudioStreamPlayer

const UP = Vector2(0, -1)
const GRAVITY = 1500