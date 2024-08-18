extends CharacterBody2D

class_name Shape

var _is_block_frozen = false
var _block_fall_speed: float = 30.0
var _block_move_speed: float = 30.0

func _init(speed: float) -> void:
	_block_fall_speed = speed

func _on_timer_timeout() -> void:
	if not _is_block_frozen:
		_move_block_downward()

func _move_block_downward() -> void:
	position.y += _block_fall_speed

func _process(_delta) -> void:
	if not _is_block_frozen:
		_move_block()

func _move_block() -> void:
	if Input.is_action_just_pressed("left"):
		position.x -= _block_move_speed
	elif Input.is_action_just_pressed("right"):
		position.x += _block_move_speed

func stop() -> void:
	_is_block_frozen = true
	_block_fall_speed = 0
