extends Node2D

var sorting_game: Resource

@onready var sorting_game_playable: Area2D = %sorting_game_playable
@onready var boris_talk: Area2D = %boris_talk
@onready var fade_in: ColorRect = %FadeIn
@onready var go_overworld: Area2D = %GoOverworld


func _ready():
	sorting_game = load("res://scenes/locations/bar/sorting_game2.tscn")
	if Globals.location_3_cleared:
		# disable all areas
		sorting_game_playable.disable()
		boris_talk.disable()
		
	# fade in
	fade_in.visible = true
	var tween = create_tween()
	tween.tween_property(fade_in, "self_modulate", Color(0, 0, 0, 0), 1.0)
	tween.tween_callback(start)


func start():
	if Globals.location_3_cleared:
		# enable overworld map
		go_overworld.enable()
		return
	
	var dialog = Dialogic.start("l3_scene4_initizalize")
	add_child(dialog)
	Dialogic.signal_event.connect(on_dialog_event)


func on_dialog_event(arg):
	match arg:
		"sorting_game":
			get_tree().change_scene_to_packed(sorting_game)
		
		"goodbye":
			Globals.location_3_cleared = true
			# disable all areas
			sorting_game_playable.disable()
			boris_talk.disable()
			
			# enable overworld map
			go_overworld.enable()
