extends Area3D

var dialogue_visible = false
var player_colliding = false

func _ready():
	hydrate_dialogue()

func _on_body_entered(body):
	print("Collided with NPC: ", body)
	if body.is_in_group("Player"):
		print("Player collided NPC")
		player_colliding = true

func _on_body_exited(body):
	if body.is_in_group("Player"):
		player_colliding = false

func _input(event):
	# Activate dialogue first time
	if Input.is_action_just_pressed("Cross"):
		if !dialogue_visible:
			print("Activating dialogue")
			show_dialogue()
		else:
			# Close after press
			print("Close dialogue")
			close_dialogue()
		
		
func show_dialogue():
	dialogue_visible = true
	$DialogueContainer.visible = true
	
func close_dialogue():
	dialogue_visible = false
	$DialogueContainer.visible = false

func hydrate_dialogue():
	$"DialogueContainer/%Name".text = "Test NPC"
	$"DialogueContainer/%Speech".text = "Something resounding and impactful despite the lack of context"
	
