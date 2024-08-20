extends Node

class_name ShapeSpawner

enum BlockShape { OShape, IShape }

var _last_spawned_shape: BlockShape

var _i_block = preload("res://Scenes/i_block.tscn")
var _o_block = preload("res://Scenes/o_block.tscn")

func spawn() -> void:
	var shape = _get_shape()
	_set_shape_position(shape)
	shape.block_stopped.connect(spawn)
	add_child(shape)
	
func _get_shape() -> Shape:
	var shape = _get_random_shape()
	var blockShape = _o_block
	
	match shape:
		BlockShape.OShape:
			blockShape = _o_block
		BlockShape.IShape:
			blockShape = _i_block
	
	var block = blockShape.instantiate()
	_last_spawned_shape = shape
	return block

func _get_random_shape() -> BlockShape:
	var randomShape = BlockShape[BlockShape.keys()[randi() % BlockShape.size()]]
	
	if _last_spawned_shape == randomShape:
		return _get_random_shape()
		
	return randomShape

func _set_shape_position(shape: Shape) -> void:
	# this seems like an over complicated calculation 
	# for spawning the block at the top of the camera
	var viewport_rect_size = get_viewport().get_camera_2d().get_viewport_rect().size
	var position = Vector2(shape.position.x, (((shape.position.y * -2) + (viewport_rect_size.y / 2)) * -1) - (shape.position.y * -1))
	shape.set_deferred("position", position)
	
