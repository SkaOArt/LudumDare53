extends SelectArea


@export var timeline_name: String


func _left_click():
	# start dialog
	Dialogic.start(timeline_name)


func _right_click():
	# ToDo
	pass
