extends RigidBody3D

@export var health = 30

func damage(damage_points):
	health -= damage_points
	if health <= 0:
		destroy_self()
	
func destroy_self():
	queue_free()
