class_name SelectLocationArea
extends SelectArea


@export var location: PackedScene

@onready var fade_in: ColorRect = %FadeIn


func _left_click():
	# stop mouse inputs
	fade_in.mouse_filter = Control.MOUSE_FILTER_STOP
	
	# reset cursor
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	
	# fade out
	var tween = fade_in.create_tween()
	tween.tween_property(fade_in, "self_modulate", Color(0.13, 0.13, 0.13, 1), 0.4)
	
	# change scene
	tween.tween_callback(func(): get_tree().change_scene_to_packed(location))	


func _right_click():
	# ToDo
	pass
