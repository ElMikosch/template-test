extends Node


func change_scene(new_scene: String, params = {}):
	if not ResourceLoader.exists(new_scene):
		push_error("Scene resource not found: ", new_scene)
		return
	Transitions.fade_in()
	await Transitions.transition_covered_screen
	var scene = load(new_scene) as PackedScene
	var current_scene = get_tree().current_scene
	current_scene.queue_free()
	await current_scene.tree_exited  # wait for the current scene to be fully removed
	var instanced_scn: Node = scene.instantiate()  # triggers _init
	get_tree().root.add_child(instanced_scn)  # triggers _ready
	get_tree().current_scene = instanced_scn
	if instanced_scn.has_method("_pre_start"):
		await instanced_scn._pre_start(params)
	Transitions.fade_out()
