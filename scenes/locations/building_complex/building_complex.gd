extends Node2D


func _ready() -> void:	
	var dialog = Dialogic.start("name")
	add_child(dialog)
