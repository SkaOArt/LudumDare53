extends SelectArea


@export var timeline_name: String


func _left_click():
	# start dialog
	var dialog = Dialogic.start(timeline_name)
	#if !is_instance_valid(get_tree().get_meta('dialogic_layout_node', '')):
	add_child(dialog)


func _right_click():
	# ToDo
	pass
