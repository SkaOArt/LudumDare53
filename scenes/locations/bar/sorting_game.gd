extends Node2D


func _ready() -> void:
	# placeholder
	Dialogic.signal_event.connect(on_dialog_signal)
	var dialog = Dialogic.start("l3_placeholder")
	add_child(dialog)


func on_dialog_signal(arg):
	match arg:
		"exit":
			get_tree().change_scene_to_file("res://scenes/locations/bar/bar.tscn")
