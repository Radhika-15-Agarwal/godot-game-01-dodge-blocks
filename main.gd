extends Node2D

@export var block_scene : PackedScene
@export var spawn_rate : float = 1.0

var timer := 0.0

func _process(delta: float) -> void:
	timer += delta
	if timer >= spawn_rate:
		spawn_block()
		timer = 0.0

func spawn_block():
	var block = block_scene.instantiate()
	add_child(block)
	
	var screen_width = get_viewport_rect().size.x
	block.position.x = randf_range(0, screen_width)
	block.position.y = -50
