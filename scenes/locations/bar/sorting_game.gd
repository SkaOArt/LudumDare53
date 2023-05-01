extends Node2D

@onready var inventory_slots = %SlotContainer

var holding_item = null


func _ready():
	for inv_slot in inventory_slots.get_children():
		(inv_slot as SlotClass).gui_input.connect(slot_gui_input.bind(inv_slot))
		#inv_slot.connect("gui_input", self, "slot_gui_input", [inv_slot])


func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			print("left click")
			if holding_item != null:
				if !slot.item: #Place holding item to slot
					slot.putIntoSlot(holding_item)
					holding_item = null
				else: #Swap holdgin item with item in slot
					var temp_item = slot.item
					slot.pickFromSlot()
					temp_item.global_position = event.global_position
					slot.putIntoSlot(holding_item)
					holding_item = temp_item
			elif slot.item:
				holding_item = slot.item
				slot.pickFromSlot()
				holding_item.global_position = get_global_mouse_position()
				
func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()
