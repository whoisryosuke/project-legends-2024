extends Node3D

@onready var match_timer = $MatchTimer
const GAME_TIME_SECS = 60
var score := 0

func _ready():
	match_timer.start(GAME_TIME_SECS)
	
func _process(delta):
	# Update timer text
	$BalloonMiniGameUI.get_node("%TimerLabel").text = str(int(match_timer.time_left))

func balloon_popped(safe):
	if safe:
		score += 100
		print("Score: ", score)
	
	# Reduce timer by 1 second
	if !safe:
		match_timer.start(match_timer.time_left - 10.0)
