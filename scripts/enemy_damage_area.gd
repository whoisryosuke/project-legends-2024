extends Area3D

@export var area_damage = 10
@onready var wait_timer = $WaitTimer

const WAIT_TIME = 4

func _on_body_entered(body):
	# Hit an player?
	if body.is_in_group("Player") and wait_timer.is_stopped():
		print("Enemy hit player!")
		var health_component = body.get_node("Health")
		if health_component:
			health_component.damage(area_damage)
			
			# Start a timer so we don't overload player with damage
			wait_timer.start(WAIT_TIME)
