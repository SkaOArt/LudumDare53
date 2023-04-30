extends Node2D


func _ready():
	var dialog = Dialogic.start("l3_scene4_initizalize")
	add_child(dialog)
	Dialogic.signal_event.connect(on_dialog_event)

func on_dialog_event(arg):
	match arg:
		"sorting_game":
			get_tree().change_scene_to_file("res://scenes/locations/bar/sorting_game.tscn")
		
		"goodbye":
			get_tree().change_scene_to_file("res://scenes/overworld.tscn")
