class_name InteractionSoundComponent extends Node

@export var enter_sound_file: AudioStreamRandomizer
@export var exit_sound_file: AudioStreamRandomizer
@export var pressed_sound_file: AudioStreamRandomizer

var target: Control


func _ready() -> void:
	target = get_parent()
	connect_signals()


func connect_signals() -> void:
	target.mouse_entered.connect(_on_mouse_entered)
	target.mouse_exited.connect(_on_mouse_exited)
	target.pressed.connect(_on_pressed)


func _on_mouse_entered() -> void:
	if enter_sound_file == null:
		return
	Audio.play(enter_sound_file.resource_path)


func _on_mouse_exited() -> void:
	if exit_sound_file == null:
		return
	Audio.play(exit_sound_file.resource_path)


func _on_pressed() -> void:
	if pressed_sound_file == null:
		return
	Audio.play(pressed_sound_file.resource_path)
