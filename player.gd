extends CharacterBody2D

@export var speed : float = 300.0

@warning_ignore("unused_parameter")
func _physics_process(delta):
	var direction = 0

	if Input.is_action_pressed("ui_left"):
		direction -= 1
	if Input.is_action_pressed("ui_right"):
		direction += 1

	velocity.x = direction * speed
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	position.x = clamp(position.x, 20, screen_size.x - 20)
