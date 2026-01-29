extends CharacterBody2D


@export var fall_speed: float = 200.0;


func _physics_process(delta: float) -> void:
	
	velocity.y = fall_speed;
	move_and_slide()
	
	if position.y > 700:
		queue_free()
