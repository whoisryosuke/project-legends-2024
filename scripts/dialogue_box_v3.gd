extends NinePatchRect

var name_text = "Character Name"
var dialogue = "Hello world"
@onready var close_timer = $CloseTimer
# How long to wait between re-opening dialogue
# Prevents NPC from spawning dialogue infinitely since it shares same button press
const CLOSE_DELAY = 2 

func _input(event):
	if visible:
		print("Dialogue visible - checking for input")
		if Input.is_action_just_pressed("Cross"):
			print("Hiding dialogue")
			hide_dialogue()

func show_dialogue():
	if close_timer.is_stopped():
		%Name.text = name_text
		%Speech.text = dialogue
		visible = true
	
func hide_dialogue():
	visible = false
	close_timer.start(CLOSE_DELAY)	
