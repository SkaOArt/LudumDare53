class_name SlotClass
extends TextureRect

var item = null


func _ready():
	item = get_child(0)


func pickFromSlot():
	remove_child(item)
	var inventoryNode = find_parent("sorting_game")
	inventoryNode.add_child(item)
	item = null

func putIntoSlot(new_item):
	item = new_item
	print(item)
	item.position = Vector2(0,0)
	var inventoryNode = find_parent("sorting_game")
	inventoryNode.remove_child(item)
	add_child(item)

func get_current_list():
	return get_child(0)
