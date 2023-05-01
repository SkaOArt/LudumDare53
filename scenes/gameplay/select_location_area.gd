class_name SelectLocationArea
extends SelectArea


@export var location: PackedScene


func _left_click():
	# change scene
	get_tree().change_scene_to_packed(location)


func _right_click():
	# ToDo
	pass
