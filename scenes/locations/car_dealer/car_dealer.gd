extends Node2D


@onready var fade_in: ColorRect = %FadeIn
@onready var carson: Area2D = %Carson
@onready var go_overworld: Area2D = %GoOverworld


func _ready() -> void:
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
	var dialog = Dialogic.start("l2_scene3")
	add_child(dialog)


func on_dialog_event(arg):
	match arg:
		"talked_seller":
			Globals.location_2_cleared = true
			exit_location()


func exit_location():
	# disable all areas
	carson.disable()
	
	# enable overworld map
	go_overworld.enable()
