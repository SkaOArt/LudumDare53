extends SelectArea


@export var timeline_name: String


func _left_click():
	# start dialog
	var dialog = Dialogic.start(timeline_name)
	add_child(dialog)


func _right_click():
	# ToDo
	pass
