extends Node3D

@onready var scene_container = $LevelLoader

const TEST_LEVEL_PATH : String = "res://scenes/levels/test_level.tscn"

func _ready():
	start_test_level()

func load_test_level():
	ResourceLoader.load_threaded_request(TEST_LEVEL_PATH)

func start_test_level():
	load_test_level()
	add_level_to_scene(TEST_LEVEL_PATH)
	
func add_level_to_scene(path):
	# Obtain the resource now that we need it
	var game_scene = ResourceLoader.load_threaded_get(path)
	# Instantiate the enemy scene and add it to the current scene
	var game = game_scene.instantiate()
	
	# Check if level has a starting spot for player
	var player_start = game.get_node("PlayerStart")
	if player_start:
		$Player.position = player_start.position
	
	# Clear previous level
	for child in scene_container.get_children():
		scene_container.remove_child(child)
		child.queue_free()
		
	# Add new level to game
	scene_container.add_child(game)
