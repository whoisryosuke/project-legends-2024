extends StaticBody3D

@onready var destroy_timer = $DestroyTimer

# State
var initial_position : Vector3 
var initial_rotation : Vector3
var direction : float

# Constants
const SPEED = 100
const DESTROY_TIME = 3

func _ready():
	destroy_timer.start(DESTROY_TIME)
	position = initial_position
	rotation = initial_rotation

func _physics_process(delta):
	# Destroy if timer has passed
	if destroy_timer.is_stopped():
		destroy_projectile()
		
	# Move project forward
	
	position += Vector3(0,0,1).rotated(Vector3(0,1,0), direction)
	#position += Vector3(1,0,1).rotated(Vector3(0,1,0), initial_rotation.z)
		
func destroy_projectile():
	queue_free()
