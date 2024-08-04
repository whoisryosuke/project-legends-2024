extends NinePatchRect

var name_text = "Character Name"
var dialogue = "Hello world"

func _input(event):
	if visible:
		print("Dialogue visible - checking for input")
		if Input.is_action_just_pressed("Cross"):
			print("Hiding dialogue")
			hide_dialogue()

func show_dialogue():
	%Name.text = name_text
	%Speech.text = dialogue
	visible = true
	
func hide_dialogue():
	visible = false
