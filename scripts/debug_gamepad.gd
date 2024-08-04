extends Node

@onready var scene_root = get_tree().get_root()
const GAMEPAD_UI_SCENE = preload("res://scenes/ui/gamepad.tscn")
const FACE_BUTTON_DEFAULT = preload("res://assets/ui/dualsense/FaceButton/Default.png")
const FACE_BUTTON_PRESSED = preload("res://assets/ui/dualsense/FaceButton/Pressed.png")
const DPAD_DEFAULT = preload("res://assets/ui/dualsense/DPad/Default.png")
const DPAD_PRESSED = preload("res://assets/ui/dualsense/DPad/Pressed.png")
const TRIGGER_DEFAULT = preload("res://assets/ui/dualsense/TriggerButton/Default.png")
const TRIGGER_PRESSED = preload("res://assets/ui/dualsense/TriggerButton/Pressed.png")
const ANALOG_DEFAULT = preload("res://assets/ui/dualsense/AnalogStick/Default.png")
const ANALOG_PRESSED = preload("res://assets/ui/dualsense/AnalogStick/Pressed.png")
const FUNC_DEFAULT = preload("res://assets/ui/dualsense/FaceButtonTiny/Default.png")
const FUNC_PRESSED = preload("res://assets/ui/dualsense/FaceButtonTiny/Pressed.png")
const TOUCHPAD_DEFAULT = preload("res://assets/ui/dualsense/Touchpad/Default.png")
const TOUCHPAD_PRESSED = preload("res://assets/ui/dualsense/Touchpad/Pressed.png")

const FACE_BUTTON_KEYS = ["Cross", "Circle", "Triangle", "Square"]
const LEFT_STICK_KEYS = ["Move Forward", "Move Backward", "Move Left", "Move Right"]
const RIGHT_STICK_KEYS = ["Camera Up", "Camera Down", "Camera Left", "Camera Right"]
const TRIGGER_KEYS = ["L1", "L2", "R1", "R2"]
const DPAD_KEYS = ["DPad Up","DPad Down","DPad Left","DPad Right"]
const FUNC_KEYS = ["Start","Select"]
const DEADZONE = 0.1

func _ready():
	# Place UI into scene
	var gamepad_ui = GAMEPAD_UI_SCENE.instantiate()
	gamepad_ui.scale.x = 0.5
	gamepad_ui.scale.y = 0.5
	scene_root.add_child.call_deferred(gamepad_ui)
	
func _input(event):
	# Get gamepad UI for reference
	var gamepad_ui = get_node("/root/DebugGamepadUI")
	if !gamepad_ui:
		return
	
	for face_button in FACE_BUTTON_KEYS:
		if Input.is_action_pressed(face_button):
			var face_button_ui = gamepad_ui.get_node("Gamepad/" + face_button)
			face_button_ui.texture = FACE_BUTTON_PRESSED
		if Input.is_action_just_released(face_button):
			var face_button_ui = gamepad_ui.get_node("Gamepad/" + face_button)
			face_button_ui.texture = FACE_BUTTON_DEFAULT
			
	for dpad_key in DPAD_KEYS:
		if Input.is_action_pressed(dpad_key):
			var face_button_ui = gamepad_ui.get_node("Gamepad/" + dpad_key)
			face_button_ui.texture = DPAD_PRESSED
		if Input.is_action_just_released(dpad_key):
			var face_button_ui = gamepad_ui.get_node("Gamepad/" + dpad_key)
			face_button_ui.texture = DPAD_DEFAULT
			
	for trigger_key in TRIGGER_KEYS:
		if Input.is_action_pressed(trigger_key):
			var face_button_ui = gamepad_ui.get_node("Gamepad/" + trigger_key)
			face_button_ui.texture = TRIGGER_PRESSED
		if Input.is_action_just_released(trigger_key):
			var face_button_ui = gamepad_ui.get_node("Gamepad/" + trigger_key)
			face_button_ui.texture = TRIGGER_DEFAULT
			
	for func_key in FUNC_KEYS:
		if Input.is_action_pressed(func_key):
			var face_button_ui = gamepad_ui.get_node("Gamepad/" + func_key)
			face_button_ui.texture = FUNC_PRESSED
		if Input.is_action_just_released(func_key):
			var face_button_ui = gamepad_ui.get_node("Gamepad/" + func_key)
			face_button_ui.texture = FUNC_DEFAULT
			
	if Input.is_action_pressed("Touchpad"):
		var face_button_ui = gamepad_ui.get_node("Gamepad/Touchpad")
		face_button_ui.texture = TOUCHPAD_PRESSED
	if Input.is_action_just_released("Touchpad"):
		var face_button_ui = gamepad_ui.get_node("Gamepad/Touchpad")
		face_button_ui.texture = TOUCHPAD_DEFAULT
			
	var input_dir = Input.get_vector("Move Left", "Move Right", "Move Forward", "Move Backward")
	if abs(input_dir.x) > DEADZONE or abs(input_dir.y) > DEADZONE:
		var face_button_ui = gamepad_ui.get_node("Gamepad/AnalogLeft")
		face_button_ui.texture = ANALOG_PRESSED
	if abs(input_dir.x) <= DEADZONE and abs(input_dir.y) <= DEADZONE:
		var face_button_ui = gamepad_ui.get_node("Gamepad/AnalogLeft")
		face_button_ui.texture = ANALOG_DEFAULT
		
	var camera_dir = Input.get_vector("Camera Left", "Camera Right", "Camera Forward", "Camera Backward")
	if abs(camera_dir.x) > DEADZONE or abs(camera_dir.y) > DEADZONE:
		var face_button_ui = gamepad_ui.get_node("Gamepad/AnalogRight")
		face_button_ui.texture = ANALOG_PRESSED
	if abs(camera_dir.x) <= DEADZONE and abs(camera_dir.y) <= DEADZONE:
		var face_button_ui = gamepad_ui.get_node("Gamepad/AnalogRight")
		face_button_ui.texture = ANALOG_DEFAULT
