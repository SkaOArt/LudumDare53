extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/ask_player_name.tscn")

func _on_settings_pressed():
	get_node("settings").show()

func _on_credit_pressed():
	get_node("credit").show()

func _on_quit_pressed():
	get_tree().quit()
