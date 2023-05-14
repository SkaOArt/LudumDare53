extends SelectArea


@export var timeline_name: String


func _left_click():
	# reset cursor
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	
	# start dialog
	Dialogic.start(timeline_name)


func _right_click():
	# ToDo
	pass
