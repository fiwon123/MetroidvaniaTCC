extends Node

onready var music = $AudioStreamPlayer

var dialogue
var GUI
var Camera2D
var game
var player
var boss1

var save_position = null
#Saves
var is_trigger1 = false
var is_trigger2 = false
var is_trigger3 = false
var is_trigger4 = false
var is_trigger5 = false
var is_destroy_barrier1 = false
var is_destroy_barrier2 = false
var is_destroy_barrier3 = false
var is_destroy_barrier4 = false
var is_defeat_boss1 = false

#Scenes
var MAIN_MENU = "res://Scenes/Screens/MainMenu.tscn"
var OPTIONS = "res://Scenes/Screens/Options.tscn"
var CREDITS = "res://Scenes/Screens/Credits.tscn"
var SAVES = "res://Scenes/Screens/Saves.tscn"
var GAME = "res://Scenes/Levels/Level1.tscn"
var FINAL = "res://Scenes/Screens/Final.tscn"

#Navigatiojn
var navigation
var destinations