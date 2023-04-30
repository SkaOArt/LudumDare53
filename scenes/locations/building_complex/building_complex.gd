extends Node2D


@onready var background: Sprite2D = %Background
@onready var paket: Area2D = %Paket
@onready var fade_in: ColorRect = %FadeIn


func _ready() -> void:
	fade_in.visible = true
	Dialogic.signal_event.connect(on_dialogic_signal)
	var dialog = Dialogic.start("name")
	add_child(dialog)


func on_dialogic_signal(arg):
	match arg:
		"name":
			var tween = create_tween()
			tween.tween_property(fade_in, "self_modulate", Color(0, 0, 0, 0), 1.0)
			tween.tween_callback(start)
		
		"packet_picked":
			paket.disable()


func start():
	var dialog = Dialogic.start("l1_scene1")
	add_child(dialog)
