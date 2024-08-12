extends Area3D

@export var scene_to_load : PackedScene
# Teleport on collide vs pressing button
@export var immediate_teleport = true

func _on_body_entered(body):
	if body.is_in_group("Player") and immediate_teleport:
		print("Collided with door!: ", body, scene_to_load)
		
		# Get access to game and change level
		var game_node = get_tree().root.get_node("SceneManager/CurrentScene/Game")
		game_node.start_level(scene_to_load)
