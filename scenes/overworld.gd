extends Node2D


@onready var fade_in: ColorRect = %FadeIn
@onready var niece_house: Area2D = %NieceHouse


func _ready() -> void:
	# reset cursor
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	
	# fade in
	fade_in.visible = true
	var tween = create_tween()
	tween.tween_property(fade_in, "self_modulate", Color(0, 0, 0, 0), 0.4)
	
	if Globals.location_3_cleared:
		niece_house.enable()
