extends Area3D

var colliding = []

func _on_body_entered(body: Node):
	var body_index =  body.get_index()
	if not body_index in colliding:
		colliding.append(body_index)
	print("Something collided with camera!: ", body, body.get_index())
	
	# Scale camera down
	print("Scale: ", $"../..".scale)
	var initial_scale = $"../..".scale.x
	var new_scale_amt = min(initial_scale - 0.1, 0.5)
	var new_scale = Vector3(new_scale_amt,new_scale_amt,new_scale_amt)
	#$"../..".scale = new_scale
	
	
func _on_body_exited(body:Node):
	await get_tree().create_timer(1.0).timeout
	var body_index =  body.get_index()
	colliding.erase(body_index)

func _process(delta):
	# If no colliding is detected, reset camera back
	if len(colliding) == 0:
		var initial_scale = $"../..".scale.x
		var new_scale_amt = clamp(initial_scale + 0.1, 0.0, 1.0)
		print(new_scale_amt)
		var new_scale = Vector3(new_scale_amt,new_scale_amt,new_scale_amt)
		#$"../..".scale = new_scale


