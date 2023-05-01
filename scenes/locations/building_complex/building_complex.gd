extends Node2D


@onready var background: Sprite2D = %Background
@onready var paket: SelectArea = %Paket
@onready var fade_in: ColorRect = %FadeIn
@onready var bgm: AudioStreamPlayer = %bgm


func _ready() -> void:
	Dialogic.signal_event.connect(on_dialog_signal)
	bgm.play()
	
	# fade in
	fade_in.visible = true
	var tween = create_tween()
	tween.tween_property(fade_in, "self_modulate", Color(0, 0, 0, 0), 1.0)
	tween.tween_callback(start)


func on_dialog_signal(arg):
	match arg:
		"searched_enough":
			paket.enable()
			var tween = paket.create_tween()
			tween.tween_property(paket, "position:x", paket.position.x - 45, 1.4)\
					.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)
			tween.parallel().tween_property(paket, "position:y", paket.position.y + 25, 1.5)\
					.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
			
		"packet_picked":
			paket.disable()
			
		"talked_miu":
			exit_location()


func start():
	var dialog = Dialogic.start("l1_scene1")
	add_child(dialog)


func exit_location():
	get_tree().change_scene_to_file("res://scenes/overworld.tscn")
