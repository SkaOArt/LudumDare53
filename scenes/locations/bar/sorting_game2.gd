extends Node2D


var bar_scene: Resource

@onready var inventory_slots = %SlotContainer
@onready var bgm: AudioStreamPlayer = %bgm


var holding_item = null
var current_list = []


func _ready():
	bgm.play()
	
	bar_scene = load("res://scenes/locations/bar/bar.tscn")
	
	for inv_slot in inventory_slots.get_children():
		(inv_slot as SlotClass).gui_input.connect(slot_gui_input.bind(inv_slot))
		#inv_slot.connect("gui_input", self, "slot_gui_input", [inv_slot])
		current_list.append(inv_slot.get_child(0))


func check_bottles() -> bool:
	for i in range(6):
		if current_list[i] == null:
			return false
		printt("bottle" + str(i + 1), current_list[i].name)
		if current_list[i].name != "bottle" + str(i + 1):
			return false
	
	return true


func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			if holding_item != null:
				# holding an item
				if !slot.item: #Place holding item to slot
					slot.putIntoSlot(holding_item)
					current_list[slot.index] = holding_item
					holding_item = null
					if check_bottles():
						for inv_slot in inventory_slots.get_children():
							(inv_slot as SlotClass).gui_input.disconnect(slot_gui_input)
						get_tree().change_scene_to_packed(bar_scene)
					
				else: #Swap holding item with item in slot
					var temp_item = slot.item
					slot.pickFromSlot()
					slot.putIntoSlot(holding_item)
					current_list[slot.index] = holding_item
					holding_item = temp_item
					
			elif slot.item != null:
				# slot has item
				holding_item = slot.item
				current_list[slot.index] = null
				slot.pickFromSlot()


func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()
