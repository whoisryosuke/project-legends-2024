extends Area3D

@export var currency_value = 100

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("Player collided Crystal")
		collect_currency()

func collect_currency():
	# Increment player's currency
	var global_player =  get_tree().get_root().get_node("GlobalPlayer")
	global_player.add_currency(currency_value)
	
	# Play animation and remove from scene
	$AnimationPlayer.play("collected")
