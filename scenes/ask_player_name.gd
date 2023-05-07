extends Node2D


func _ready() -> void:
	Dialogic.signal_event.connect(on_dialog_signal)
	Dialogic.start("name")


func on_dialog_signal(arg):
	# go to building complex scene after entering name
	if arg == "name":
		var start_location = load("res://scenes/locations/building_complex/building_complex.tscn")
		get_tree().change_scene_to_packed(start_location)
