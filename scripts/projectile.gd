extends RigidBody3D

@onready var destroy_timer = $DestroyTimer

# State
var initial_position : Vector3 
var initial_rotation : Vector3
var direction : float

# Constants
const SPEED = 0.1
const DESTROY_TIME = 3

func _ready():
	destroy_timer.start(DESTROY_TIME)
	position = initial_position
	rotation = initial_rotation
	#apply_impulse(transform.basis.z, -transform.basis.z * SPEED)

func _physics_process(delta):
	# Destroy if timer has passed
	if destroy_timer.is_stopped():
		destroy_projectile()
		
	# Move project forward
	
	position += Vector3(0,0,SPEED).rotated(Vector3(0,1,0), direction)
	#position += Vector3(1,0,1).rotated(Vector3(0,1,0), initial_rotation.z)
	
		
func destroy_projectile():
	queue_free()


func _on_body_entered(body):
	#print(body)
	if body.is_in_group("Enemies"):
		print("Hit an enemy!")
		body.damage(10)

#func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	#print(body)
