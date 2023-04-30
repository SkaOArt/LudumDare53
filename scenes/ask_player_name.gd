extends Node2D


func _ready() -> void:
	Dialogic.signal_event.connect(on_dialog_signal)
	var dialog = Dialogic.start("name")
	add_child(dialog)


func on_dialog_signal(arg):
	if arg == "name":
		get_tree().change_scene_to_file("res://scenes/overworld.tscn")
