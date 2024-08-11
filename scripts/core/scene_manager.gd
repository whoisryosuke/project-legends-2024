extends Node3D

const GAME = preload("res://scenes/core/game.tscn")

func _ready():
	$TitleScreen/%StartGameButton.pressed.connect(_on_button_pressed)
	
func _on_button_pressed():
	print("Start game")
	start_game()
	
func start_game():
	# Instantiate the enemy scene and add it to the current scene
	var game = GAME.instantiate()
	var scene_container = $CurrentScene
	for child in scene_container.get_children():
		scene_container.remove_child(child)
		child.queue_free()
		
	scene_container.add_child(game)
	#$"CanvasLayer/TitleScreen/AnimationPlayer".play("hide_ui")
	$TitleScreen.queue_free()
