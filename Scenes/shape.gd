extends CharacterBody2D

class_name Shape

signal block_stopped

@onready var area2d = $Area2D

var _is_block_frozen = false
var _block_fall_speed: float = 30.0
var _block_move_speed: float = 30.0

func _init(speed: float) -> void:
	_block_fall_speed = speed
	
func _ready() -> void:
	_add_timer()
	_setup_block_area()
	
func _setup_block_area() -> void:
	area2d.body_entered.connect(stop)

func _add_timer() -> void:
	var timer = Timer.new()
	timer.wait_time = 1.0
	timer.autostart = true
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)

func _on_timer_timeout() -> void:
	if not _is_block_frozen:
		_move_block_downward()

func _move_block_downward() -> void:
	velocity.y += _block_fall_speed
	move_and_collide(velocity)
	velocity.y = 0

func _physics_process(_delta: float) -> void:
	if not _is_block_frozen:
		_move_block()

func _move_block() -> void:
	if Input.is_action_just_pressed("left"):
		position.x -= _block_move_speed
	elif Input.is_action_just_pressed("right"):
		position.x += _block_move_speed
	elif Input.is_action_just_pressed("down"):
		position.y += _block_fall_speed
		
	move_and_collide(velocity)

func stop(body: Node2D) -> void:
	print_debug(area2d.get_child(0).position)
	_is_block_frozen = true
	_block_fall_speed = 0
	block_stopped.emit()
