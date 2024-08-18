extends Node2D

func _on_ground_body_entered(shape: Shape) -> void:
	shape.stop()
