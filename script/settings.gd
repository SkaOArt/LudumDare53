extends Control


func _on_button_pressed():
	hide()


func _on_check_button_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif button_pressed == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_audio_slider_value_changed(value):
	AudioServer.set_bus_volume_db(1, value)
