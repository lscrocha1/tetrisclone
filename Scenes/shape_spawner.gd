extends Node

class_name ShapeSpawner

var i_block = preload("res://Scenes/i_block.tscn")
var o_block = preload("res://Scenes/o_block.tscn")

func spawn() -> void:
	var shape = _get_shape()
	var size = get_viewport().get_camera_2d().position
	print_debug(size)
	shape.position = Vector2(0, 0)
	add_child(shape)
	
func _get_shape() -> Shape:
	return o_block.instantiate()
