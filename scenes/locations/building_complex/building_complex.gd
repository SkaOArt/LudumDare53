extends Node2D


@onready var background: Sprite2D = %Background
@onready var paket: Area2D = %Paket
@onready var fade_in: ColorRect = %FadeIn


func _ready() -> void:
	Dialogic.signal_event.connect(on_dialog_signal)
	
	# fade in
	fade_in.visible = true
	var tween = create_tween()
	tween.tween_property(fade_in, "self_modulate", Color(0, 0, 0, 0), 1.0)
	tween.tween_callback(start)


func on_dialog_signal(arg):
	match arg:
		"packet_picked":
			paket.disable()
		
		"talked_miu":
			exit_location()


func start():
	var dialog = Dialogic.start("l1_scene1")
	add_child(dialog)


func exit_location():
	get_tree().change_scene_to_file("res://scenes/overworld.tscn")
