extends Area2D


@export var location: PackedScene
@export var enabled: bool = true


func _ready():
	visible = enabled


func enable():
	enabled = true
	visible = true


func disable():
	enabled = false
	visible = false


func left_click():
	# change scene
	get_tree().change_scene_to_packed(location)


func right_click():
	# ToDo
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
			left_click()
		
		MOUSE_BUTTON_RIGHT:
			right_click()


func _on_mouse_entered() -> void:
	if enabled:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
