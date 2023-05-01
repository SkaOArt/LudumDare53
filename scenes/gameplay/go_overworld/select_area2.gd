class_name SelectAreaOverworld
extends Area2D


@export var cursor_shape: Input.CursorShape = Input.CURSOR_POINTING_HAND
@export var enabled: bool = true


func _ready():
	visible = enabled


func enable():
	enabled = true
	visible = true


func disable():
	enabled = false
	visible = false


func _left_click():
	pass


func _right_click():
	pass


func _on_click(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	# ignore clicks when disabled
	if not enabled:
		return
	
	# ignore all events but mouseclicks
	var mouse_button_event = event as InputEventMouseButton
	if mouse_button_event == null:
		return
	if not mouse_button_event.pressed:
		return
	
	match mouse_button_event.button_index:
		MOUSE_BUTTON_LEFT:
			_left_click()
		
		MOUSE_BUTTON_RIGHT:
			_right_click()


func _on_mouse_entered() -> void:
	if enabled:
		Input.set_default_cursor_shape(cursor_shape)


func _on_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
