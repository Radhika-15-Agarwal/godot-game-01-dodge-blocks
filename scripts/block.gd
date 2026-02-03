extends CharacterBody2D


@export var fall_speed: float = 200.0;


func _physics_process(delta: float) -> void:
	if GameManager.is_game_over:
		velocity = Vector2.ZERO
		return
	
	velocity.y = fall_speed + GameManager.score * 0.5;
	move_and_slide()
	
	if position.y > 700:
		queue_free()
