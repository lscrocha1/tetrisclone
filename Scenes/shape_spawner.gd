extends Node

class_name ShapeSpawner

var i_block = preload("res://Scenes/i_block.tscn")
var o_block = preload("res://Scenes/o_block.tscn")

func spawn() -> void:
	var shape = _get_shape()
	var viewport_rect_size = get_viewport().get_camera_2d().get_viewport_rect().size
	# this seems like an over complicated calculation 
	# for spawning the block at the top of the camera
	shape.position = Vector2(shape.position.x, (((shape.position.y * -2) + (viewport_rect_size.y / 2)) * -1) - (shape.position.y * -1))
	add_child(shape)
	
func _get_shape() -> Shape:
	return i_block.instantiate()
