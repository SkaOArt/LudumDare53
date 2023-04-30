extends Node2D


func _ready():
	var dialog = Dialogic.start("l4_scene4_initizalize")
	add_child(dialog)
