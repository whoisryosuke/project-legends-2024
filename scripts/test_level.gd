extends Node3D

@onready var scene_root = get_tree().get_root()
@onready var dialogue_manager_scene = preload("res://scenes/ui/dialogue_box_v3.tscn")

func _ready():
	print("Adding dialogue manager to scene")
	var dialogue_manager = dialogue_manager_scene.instantiate()
	dialogue_manager.visible = false
	scene_root.add_child.call_deferred(dialogue_manager)
