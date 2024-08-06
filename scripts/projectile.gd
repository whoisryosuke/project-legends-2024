extends RigidBody3D

@onready var destroy_timer = $DestroyTimer

# State
var initial_position : Vector3 
var initial_rotation : Vector3
var direction : float
var exploding :bool = false

# Constants
const SPEED = 0.1
const DESTROY_TIME = 3

func _ready():
	destroy_timer.start(DESTROY_TIME)
	position = initial_position
	rotation = initial_rotation
	rotation.y = direction
	#$ExplosionVFX.rotation.x = 0
	$ExplosionVFX.rotation.x = direction
	print("explode rotation intial: ", $ExplosionVFX.rotation.x)
	#apply_impulse(transform.basis.z, -transform.basis.z * SPEED)

func _physics_process(delta):
	# Destroy if timer has passed
	if destroy_timer.is_stopped():
		destroy_projectile()
		
	if exploding:
		return
		
	# Move project forward
	
	position += Vector3(0,0,SPEED).rotated(Vector3(0,1,0), direction)
	#position += Vector3(1,0,1).rotated(Vector3(0,1,0), initial_rotation.z)
	
	
# Animates explosion and remove from scene
func explode_projectile():
	$AnimationPlayer.play("explode")
		
# Removes project from scene
func destroy_projectile():
	print("Destroying projectile")
	queue_free()


func _on_body_entered(body):
	# Hit an enemy?
	if body.is_in_group("Enemies"):
		print("Hit an enemy!")
		body.damage(10)
		
	# Hit a wall?
	if body is GridMap:
		print("Hit a wall!")
		exploding = true
		explode_projectile()

#func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	#print(body)
