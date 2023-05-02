extends Node2D


@onready var moni: Sprite2D = %Moni


func _on_back_pressed():
	hide()


func _on_button_pressed() -> void:
	var tween = moni.create_tween()
	tween.tween_property(moni, "self_modulate", Color(1, 1, 1, 1), 0.5)
