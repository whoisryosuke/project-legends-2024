extends RigidBody3D


func _on_body_entered(body):
	print("Collided with NPC: ", body)
