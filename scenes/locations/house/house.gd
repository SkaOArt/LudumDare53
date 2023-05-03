extends Node2D


@onready var fade_in: ColorRect = %FadeIn
@onready var end: Sprite2D = %End
@onready var bgm: AudioStreamPlayer = %bgm


func _ready() -> void:
	bgm.play()
	
	Dialogic.signal_event.connect(on_dialog_event)
	
	# fix cursor
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	
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
	match arg:
		"lara_name":
			Dialogic.VAR.lara = "Lara"
		
		"end":
			# bgm louder
			var bgm_tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
			bgm_tween.tween_property(bgm, "volume_db", -8.0, 6.0)
			
			# fade in
			fade_in.visible = true
			var tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
			tween.tween_property(end, "self_modulate", Color(1, 1, 1, 1), 6.0)
