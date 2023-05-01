extends Control


const cursor_normal = preload("res://assets/courser/cursor_normal.png")
const cursor_questionmark = preload("res://assets/courser/cursor_questionmark.png")
const cursor_mag = preload("res://assets/courser/cursor_mag.png")
const cursor_process = preload("res://assets/courser/cursor_process.png")
const cursor_map = preload("res://assets/courser/cursor_map.png")

@onready var fade_out: ColorRect = %FadeOut


func _ready() -> void:
	# replace shapes with custom cursors
	# change the shape in-game will result in the coresponding cursor
	Input.set_custom_mouse_cursor(cursor_normal, Input.CURSOR_ARROW, Vector2(10, 2))
	Input.set_custom_mouse_cursor(cursor_process, Input.CURSOR_POINTING_HAND, Vector2(15, 15))
	Input.set_custom_mouse_cursor(cursor_questionmark, Input.CURSOR_WAIT, Vector2(10, 8))
	Input.set_custom_mouse_cursor(cursor_mag, Input.CURSOR_DRAG, Vector2(8, 8))
	Input.set_custom_mouse_cursor(cursor_map, Input.CURSOR_MOVE, Vector2(15, 15))


func _on_play_pressed():
	# stop mouse inputs
	fade_out.mouse_filter = Control.MOUSE_FILTER_STOP
	
	# fade out
	var tween = fade_out.create_tween()
	tween.tween_property(fade_out, "self_modulate", Color(0.13, 0.13, 0.13, 1), 0.2)
	
	# change scene
	tween.tween_callback(func(): get_tree().change_scene_to_file("res://scenes/ask_player_name.tscn"))	


func _on_settings_pressed():
	get_node("settings").show()

func _on_credit_pressed():
	get_node("credit").show()

func _on_quit_pressed():
	get_tree().quit()
