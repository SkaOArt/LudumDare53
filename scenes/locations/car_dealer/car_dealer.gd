extends Node2D


@onready var fade_in: ColorRect = %FadeIn
@onready var carson: Area2D = %Carson


func _ready() -> void:
	# fade in
	fade_in.visible = true
	var tween = create_tween()
	tween.tween_property(fade_in, "self_modulate", Color(0, 0, 0, 0), 1.0)
	tween.tween_callback(start)


func start():
	# auto start
	Dialogic.signal_event.connect(on_dialog_event)
	var dialog = Dialogic.start("l2_scene3")
	add_child(dialog)


func on_dialog_event(arg):
	if arg == "car":
		carson.disable()
