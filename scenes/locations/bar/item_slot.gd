class_name SlotClass
extends TextureRect

@export var index: int

var item = null


func _ready():
	item = get_child(0)


func pickFromSlot():
	remove_child(item)
	owner.add_child(item)
	item = null


func putIntoSlot(new_item):
	item = new_item
	owner.remove_child(item)
	add_child(item)
	item.position = Vector2(16, 20)


func get_current_list():
	return get_child(0)
