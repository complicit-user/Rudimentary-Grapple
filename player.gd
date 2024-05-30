extends CharacterBody2D
@onready var pivot = $pivot
@onready var origin = pivot.global_rotation

func _process(delta):
	# Get the global mouse position
	var mouse_position = get_global_mouse_position()
	
	# Calculate the direction vector from the Node2D to the mouse position
	var direction = (mouse_position - global_position).normalized()
	
	# Calculate the angle in radians between the direction vector and the x-axis
	var angle = atan2(direction.y, direction.x)
	
	# Rotate the Node2D to face the mouse cursor
	if Input.is_action_just_pressed("hook"):
		pivot.rotate(angle)
		

func _on_chain_hooked(hooked_position):
	await get_tree().create_timer(0.2).timeout
	var tween = create_tween()
	tween.tween_property(self, "position", hooked_position,0.75)
