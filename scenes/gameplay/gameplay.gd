extends Node2D

var elapsed: float = 0.0


func _ready() -> void:
	$Icon.position = get_viewport().get_visible_rect().size / 2


func _process(delta: float) -> void:
	elapsed += delta
	$Icon.position.x = (
		get_viewport().get_visible_rect().size.x / 2 + 150 * sin(2 * 0.4 * PI * elapsed)
	)
	$Icon.position.y = (
		get_viewport().get_visible_rect().size.y / 2 + 100 * sin(2 * 0.2 * PI * elapsed)
	)


func _pre_start(_params) -> void:
	pass  #get your params here
