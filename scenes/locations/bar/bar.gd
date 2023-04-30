extends Node2D


func _ready():
	var dialog = Dialogic.start("l4_scene4_beginning")
	add_child(dialog)
