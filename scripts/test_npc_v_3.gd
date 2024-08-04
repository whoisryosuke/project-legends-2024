extends Area3D

var dialogue_visible = false
var player_colliding = false

const NPC_NAME = "Test NPC"
const NPC_DIALOGUE = "Something resounding and impactful despite the lack of context"

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
	if player_colliding and Input.is_action_just_pressed("Cross"):
		var dialogue_manager =  get_tree().get_root().get_node("DialogueManager")
		if dialogue_manager and !dialogue_manager.visible:
			print("NPC dialogue time! ", dialogue_manager)
			dialogue_manager.name_text = NPC_NAME
			dialogue_manager.dialogue = NPC_DIALOGUE
			dialogue_manager.show_dialogue()
		
		
#func show_dialogue():
	#dialogue_visible = true
	#$DialogueContainer.visible = true
	#
#func close_dialogue():
	#dialogue_visible = false
	#$DialogueContainer.visible = false
#
#func hydrate_dialogue():
	#$"DialogueContainer/%Name".text = "Test NPC"
	#$"DialogueContainer/%Speech".text = "Something resounding and impactful despite the lack of context"
	
