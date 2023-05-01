extends Control


const cursor_normal = preload("res://assets/courser/cursor_normal.png")
const cursor_questionmark = preload("res://assets/courser/cursor_questionmark.png")
const cursor_mag = preload("res://assets/courser/cursor_mag.png")


func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor_normal, Input.CURSOR_ARROW, Vector2(16, 8))
	Input.set_custom_mouse_cursor(cursor_questionmark, Input.CURSOR_POINTING_HAND, Vector2(16, 20))
	Input.set_custom_mouse_cursor(cursor_mag, Input.CURSOR_MOVE, Vector2(16, 16))


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/ask_player_name.tscn")

func _on_settings_pressed():
	get_node("settings").show()

func _on_credit_pressed():
	get_node("credit").show()

func _on_quit_pressed():
	get_tree().quit()
