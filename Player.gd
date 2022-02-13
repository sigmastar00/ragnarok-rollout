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

export var ouch_length: int
export var ouch_speed: float

export var bonk_shake: float

# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==
var _active := false

var _velocity := Vector2.ZERO

var _dash_frames := 0
var _dashing := false
var _dash_vector: Vector2

var _ouch_mode := false
var _ouch_vector: Vector2
var _ouch_frames := 0

# == ONREADY VARIABLES ==
onready var _line := $Line2D as Line2D
onready var _sprite := $Sprite as Sprite
onready var _sparkles := $Particles2D as Particles2D
onready var _camera := $Camera2D as Camera2D

# == BUILT-IN VIRTUAL METHODS ==

func _init()  -> void:
	pass


func _ready()  -> void:
	pass
	
	
func _physics_process(delta: float) -> void:
	if _ouch_frames >= ouch_length:
		_ouch_mode = false
		_ouch_frames = 0
	
	if _dash_frames >= dash_length:
		_dashing = false
		_dash_frames = 0
	
	if not _ouch_mode and not _dashing and Input.is_action_just_pressed("dash"):
		_active = true
		_dash_vector = _get_move_vector()
		_dashing = true
	
	if _dashing:
		_velocity = dash_speed * _dash_vector
		_dash_frames += 1
	elif _ouch_mode:
		_velocity = ouch_speed * _ouch_vector
		_ouch_frames += 1
	else:
		_velocity.y += gravity * delta
		_velocity.x = move_toward(_velocity.x, 0, friction * delta)
		
	if not _active:
		_velocity = Vector2.ZERO
	_velocity = move_and_slide(_velocity)
	
	if not _ouch_mode and get_slide_count() > 0:
		var collision := get_slide_collision(0)
		_dashing = false
		_ouch_mode = true
		_ouch_vector = collision.normal
		_camera.shake(Vector2.DOWN * bonk_shake)
		
	

func _process(delta: float) -> void:
	var angle := _get_move_vector().angle()
	_line.rotation = angle
	var bonus_spin = 4 if _dashing else 1
	_sprite.rotate(_velocity.length() * bonus_spin * spin_modifier * delta)
	_sparkles.emitting = _dashing
	if _dashing:
		_sprite.modulate = Color(1.5, 1.5, 1.6)
	elif _ouch_mode:
		_sprite.modulate = Color(1, 0.1, 0.1) 
	else:
		_sprite.modulate = Color.white


# == PUBLIC METHODS ==

# == PRIVAE METHODS ==
func _get_move_vector() -> Vector2:
	var vec := get_local_mouse_position().normalized()
	vec.x = max(vec.x, 0)
	return vec

# == SIGNAL HANDLERS ==


