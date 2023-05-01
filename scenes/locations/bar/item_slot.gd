extends TextureRect

var item = null

func pickFromSlot():
	remove_child(item)
	var inventoryNode = find_parent("sorting_game")
	inventoryNode.add_child(item)
	item = null

func putIntoSlot(new_item):
	item = new_item
	item.position = Vector2(0, 0)
	var inventoryNode = find_parent("sorting_game")
	inventoryNode.remove_child(item)
	add_child(item)
