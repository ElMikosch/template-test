extends CanvasLayer

@export var resume_button: Button
@export var return_to_menu_button: Button


func _ready():
	pause_hide()
	resume_button.pressed.connect(resume)
	return_to_menu_button.pressed.connect(_on_return_to_menu_button_pressed)


func pause_show():
	show()


func pause_hide():
	hide()


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			resume()
		else:
			pause_game()
		get_viewport().set_input_as_handled()


func resume():
	get_tree().paused = false
	pause_hide()


func pause_game():
	get_tree().paused = true
	pause_show()


func _on_return_to_menu_button_pressed() -> void:
	resume()
	Game.change_scene("res://scenes/main-menu/main_menu.tscn")
