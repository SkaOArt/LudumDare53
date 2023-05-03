extends Node2D

@export var boris_normal: CompressedTexture2D
@export var boris_angry: CompressedTexture2D
@export var boris_friendly: CompressedTexture2D

var sorting_game: Resource

@onready var sorting_game_playable: Area2D = %sorting_game_playable
@onready var boris_talk: Area2D = %boris_talk
@onready var fade_in: ColorRect = %FadeIn
@onready var go_overworld: Area2D = %GoOverworld
@onready var bgm: AudioStreamPlayer = %bgm
@onready var onkel: Sprite2D = %Onkel


func _ready():
	# DEBUG
	#Globals.location_1_cleared = true
	#Globals.location_2_cleared = true
	#Dialogic.VAR.location2.completed = true
	
	bgm.play()
	
	if not Globals.location_2_cleared:
		sorting_game_playable.disable()
	
	if Globals.location_3_cleared:
		onkel.texture = boris_normal
		# disable all areas
		sorting_game_playable.disable()
		boris_talk.disable()
		
	else:
		sorting_game = load("res://scenes/locations/bar/sorting_game2.tscn")
		
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
	
	Dialogic.signal_event.connect(on_dialog_event)
	var dialog = Dialogic.start("l3_scene4_initizalize")
	add_child(dialog)
	


func on_dialog_event(arg):
	match arg:
		"boris_normal":
			onkel.texture = boris_normal
		
		"boris_angry":
			onkel.texture = boris_angry
		
		"boris_friendly":
			onkel.texture = boris_friendly
		
		"boris_name":
			Dialogic.VAR.boris = "Boris"
		
		"sorting_game":
			get_tree().change_scene_to_packed(sorting_game)
		
		"closed":
			# disable all areas
			boris_talk.disable()
			
			# enable overworld map
			go_overworld.enable()
		
		"goodbye":
			Globals.location_3_cleared = true
			# disable all areas
			sorting_game_playable.disable()
			boris_talk.disable()
			
			# enable overworld map
			go_overworld.enable()
