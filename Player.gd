extends KinematicBody2D
## Class documentation.


# == SIGNALS ==

# == ENUMS ==

# == CONSTANTS ==

# == EXPORTED VARIABLES ==
export var dash_speed: float
export var dash_length: int
export var friction: float
export var gravity: float
export var spin_modifier: float


# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==
var _velocity := Vector2.ZERO

var _dash_frames := 0
var _dashing := false
var _dash_vector: Vector2

# == ONREADY VARIABLES ==
onready var _line := $Line2D as Line2D
onready var _sprite := $Sprite as Sprite
onready var _sparkles := $Particles2D as Particles2D

# == BUILT-IN VIRTUAL METHODS ==

func _init()  -> void:
	pass


func _ready()  -> void:
	pass
	
	
func _physics_process(delta: float) -> void:
	if _dash_frames >= dash_length:
		_dashing = false
		_dash_frames = 0
	
	if not _dashing and Input.is_action_just_pressed("dash"):
		_dash_vector = _get_move_vector()
		_dashing = true
	
	if _dashing:
		_velocity = dash_speed * _dash_vector
		_dash_frames += 1
	else:
		_velocity.y += gravity * delta
		_velocity.x = move_toward(_velocity.x, 0, friction * delta)
		
	_velocity = move_and_slide(_velocity)
	

func _process(delta: float) -> void:
	var angle := _get_move_vector().angle()
	_line.rotation = angle
	var bonus_spin = 4 if _dashing else 1
	_sprite.rotate(_velocity.length() * bonus_spin * spin_modifier * delta)
	_sparkles.emitting = _dashing
	_sprite.modulate = Color(1.5, 1.5, 1.6) if _dashing else Color.white


# == PUBLIC METHODS ==

# == PRIVAE METHODS ==
func _get_move_vector() -> Vector2:
	var vec := get_local_mouse_position().normalized()
	vec.x = max(vec.x, 0)
	return vec

# == SIGNAL HANDLERS ==


