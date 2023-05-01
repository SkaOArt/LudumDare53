extends Node2D


@onready var niece_house: Area2D = %NieceHouse


func _ready() -> void:
	if Globals.niece_unlocked:
		niece_house.enable()
