extends Node

@export var health = 30

func damage(damage_points):
	health -= damage_points
	if health <= 0:
		destroy_self()
	
func destroy_self():
	var parent_node = get_parent()
	# Make sure we don't remove character from scene
	# Instead trigger death sequence
	parent_node.death()
