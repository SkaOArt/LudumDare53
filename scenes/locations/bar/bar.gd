extends Node2D


func _ready():
	var dialog = Dialogic.start("l4_scene4_initizalize")
	add_child(dialog)
	Dialogic.signal_event.connect(on_dialog_event)

func on_dialog_event(arg):
	if arg == "sorting_game":
		get_tree().change_scene_to_file("res://scenes/gameplay/sorting_game.tscn")

