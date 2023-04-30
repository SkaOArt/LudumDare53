extends Area2D


@export var timeline_name: String


func left_click():
	# start dialog
	var dialog = Dialogic.start(timeline_name)
	add_child(dialog)


func right_click():
	# ToDo
	pass


func _on_click(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	var mouse_button_event = event as InputEventMouseButton
	if mouse_button_event == null:
		return
	
	match mouse_button_event.button_index:
		MOUSE_BUTTON_LEFT:
			left_click()
		
		MOUSE_BUTTON_RIGHT:
			right_click()


func _on_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
