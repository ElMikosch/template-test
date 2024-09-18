extends Control

@export var start_game_button: Button
@export var credits_button: Button
@export var quit_button: Button


func _ready() -> void:
	start_game_button.pressed.connect(self._on_start_game_pressed)
	credits_button.pressed.connect(self._on_credits_pressed)
	quit_button.pressed.connect(self._on_quit_pressed)

	if OS.has_feature("web"):
		quit_button.hide()


func _on_start_game_pressed():
	Game.change_scene("res://scenes/gameplay/gameplay.tscn", {kek = "lel"})


func _on_credits_pressed():
	Game.change_scene("res://core/credits/credits.tscn")


func _on_quit_pressed():
	get_tree().quit()
