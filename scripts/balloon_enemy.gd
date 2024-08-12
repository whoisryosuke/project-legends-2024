extends RigidBody3D

@export var safe := true

func death():
	print("Balloon popped!: ", safe)
	# Balloon is usually nested inside 1 more component
	# Then inside the game itself -- which has methods we need to access
	var parent = get_parent().get_parent()
	
	if parent.has_method("balloon_popped"):
		parent.balloon_popped(safe)
		
		# Remove balloon
		# TODO: Pop animation then remove
		queue_free()
