extends Node

@onready var shape_spawner: ShapeSpawner = $"../ShapeSpawner"

func _on_ground_body_entered(shape: Shape) -> void:
	shape.stop(shape)
	
func spawn_shape():
	shape_spawner.spawn()
