extends Node2D


var paket_revealed: bool = false

@onready var background: Sprite2D = %Background
@onready var paket: Area2D = %Paket
@onready var fade_in: ColorRect = %FadeIn
@onready var bgm: AudioStreamPlayer = %bgm
@onready var snd_phone: AudioStreamPlayer = %snd_phone
@onready var go_overworld: Area2D = %GoOverworld

@onready var door: Area2D = $Door
@onready var fence: Area2D = $Fence
@onready var letterbox: Area2D = $Letterbox
@onready var bin: Area2D = $Bin


func _ready() -> void:
	Dialogic.signal_event.connect(on_dialog_signal)
	
	# fade in
	fade_in.visible = true
	var tween = create_tween()
	tween.tween_property(fade_in, "self_modulate", Color(0, 0, 0, 0), 1.0)
	tween.tween_callback(start)


func start():
	if Globals.location_1_cleared:
		exit_location()
		return
	
	snd_phone.play()
	
	Dialogic.start("l1_scene1")


func on_dialog_signal(arg):
	match arg:
		"phone_stop":
			snd_phone.stop()
		
		"bgm":
			bgm.play()
			door.enable()
			fence.enable()
			letterbox.enable()
			bin.enable()
		
		"searched_enough":
			if paket_revealed:
				return
			
			paket_revealed = true
			paket.enable()
			var tween = paket.create_tween()
			tween.tween_property(paket, "position:x", paket.position.x - 45, 1.4)\
					.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)
			tween.parallel().tween_property(paket, "position:y", paket.position.y + 25, 1.5)\
					.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
			
		"packet_picked":
			paket.disable()
			
		"talked_miu":
			Globals.location_1_cleared = true
			exit_location()


func exit_location():
	# disable all areas
	door.disable()
	fence.disable()
	letterbox.disable()
	bin.disable()
	
	# enable overworld map
	go_overworld.enable()
