extends Control


func _on_resume_pressed():
	hide()


func _on_settings_pressed():
	get_node("settings").show()


func _on_credits_pressed():
	get_node("credit").show()


func _on_exit_pressed():
	get_node("Exit").show()


func _on_yes_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_no_pressed():
	get_node("Exit").hide()
