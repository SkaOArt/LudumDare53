extends Node2D


func _ready() -> void:
	var dialog = Dialogic.start("l2_scene3")
	add_child(dialog)
