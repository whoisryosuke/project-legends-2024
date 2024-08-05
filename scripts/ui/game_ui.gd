extends AspectRatioContainer

@onready var global_player = get_tree().get_root().get_node("GlobalPlayer")

func _process(delta):
	# Keep any UI state up to date
	%Currency.text = str(global_player.currency)
