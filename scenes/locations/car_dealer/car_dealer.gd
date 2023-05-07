extends Node2D


@onready var fade_in: ColorRect = %FadeIn
@onready var carson: Area2D = %Carson
@onready var go_overworld: Area2D = %GoOverworld
@onready var bgm: AudioStreamPlayer = %bgm


func _ready() -> void:
	bgm.play()
	
	if Globals.location_2_cleared:
		# disable all areas
		carson.disable()
		
	# fade in
	fade_in.visible = true
	var tween = create_tween()
	tween.tween_property(fade_in, "self_modulate", Color(0, 0, 0, 0), 1.0)
	tween.tween_callback(start)


func start():
	if Globals.location_2_cleared:
		# enable overworld map
		go_overworld.enable()
		return
	
	# auto start
	Dialogic.signal_event.connect(on_dialog_event)
	Dialogic.start("l2_scene3")


func on_dialog_event(arg):
	match arg:
		"carson_hide":
			carson.disable()
		
		"carson_name":
			Dialogic.VAR.seller = "Carson"
		
		"talked_seller":
			Globals.location_2_cleared = true
			exit_location()


func exit_location():
	# disable all areas
	carson.disable()
	
	# enable overworld map
	go_overworld.enable()
