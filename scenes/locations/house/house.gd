extends Node2D


@onready var fade_in: ColorRect = %FadeIn


func _ready() -> void:
	Dialogic.signal_event.connect(on_dialog_event)
	
	# fade in
	fade_in.visible = true
	var tween = create_tween()
	tween.tween_property(fade_in, "self_modulate", Color(0, 0, 0, 0), 1.0)
	#tween.tween_callback(start)


func start():
	# auto start
	var dialog = Dialogic.start("l4_intro")
	add_child(dialog)


func on_dialog_event(arg):
	if arg == "end":
		# ToDo
		get_tree().change_scene_to_file("res://scenes/main.tscn")
