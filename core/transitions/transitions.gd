extends CanvasLayer

@export var animation_player: AnimationPlayer

signal transition_covered_screen
signal transition_finished


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.animation_finished.connect(self._on_animation_player_animation_finished)


func fade_in():
	animation_player.play("fade_in")


func fade_out():
	animation_player.play("fade_out")


func _on_animation_player_animation_finished(anim_name: StringName):
	if anim_name == "fade_in":
		transition_covered_screen.emit()
	else:
		transition_finished.emit()
