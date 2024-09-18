class_name AnimationComponent extends Node

@export var from_center: bool = true
@export var hover_scale: Vector2 = Vector2(1, 1)
@export var time: float = 0.1
@export var transition_type: Tween.TransitionType

var target: Control
var default_scale: Vector2


func _ready() -> void:
	target = get_parent()
	_connect_signals()
	call_deferred("_setup")


func _exit_tree() -> void:
	_disconnect_signals()


func _connect_signals() -> void:
	target.mouse_entered.connect(_on_mouse_entered)
	target.mouse_exited.connect(_on_mouse_exited)


func _disconnect_signals() -> void:
	target.mouse_entered.disconnect(_on_mouse_entered)
	target.mouse_exited.disconnect(_on_mouse_exited)


func _setup() -> void:
	if from_center:
		target.pivot_offset = target.size / 2
	default_scale = target.scale


func _on_mouse_entered() -> void:
	_add_tween("scale", hover_scale, time)


func _on_mouse_exited() -> void:
	_add_tween("scale", default_scale, time)


func _add_tween(property: String, value, seconds: float) -> void:
	if get_tree() == null:
		return

	var tween = get_tree().create_tween()
	tween.tween_property(target, property, value, seconds).set_trans(transition_type)
