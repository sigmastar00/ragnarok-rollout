extends KinematicBody2D
## Class documentation.

# == SIGNALS ==

# == ENUMS ==

# == CONSTANTS ==

# == EXPORTED VARIABLES ==
export var player: NodePath
export var dash_speed: float
export var friction: float
export var run_speed: float
export var run_length: int

# == PUBLIC VARIABLES ==
var active := true

# == PRIVATE VARIABLES ==
var _player: KinematicBody2D
var _velocity := Vector2.ZERO

var _red_frames := 0

# == ONREADY VARIABLES ==

# == BUILT-IN VIRTUAL METHODS ==
func _init() -> void:
	pass


func _ready() -> void:
	_player = get_node(player) as KinematicBody2D
	assert(_player != null)
	var result := _player.connect("dashed", self, "_on_player_dashed")
	assert(result == OK)
	result = _player.connect("hit_boss", self, "_on_player_hit_boss")
	assert(result == OK)


func _physics_process(delta: float) -> void:
	if not active:
		return

	if _red_frames > 0:
		_red_frames -= 1
		_velocity.x = run_speed

	_velocity.x = move_toward(_velocity.x, 0, friction * delta)
	position += _velocity * delta


func _process(delta: float) -> void:
	if _red_frames > 0:
		self.modulate = Color(1.0, 0.1, 0.1)
	else:
		self.modulate = Color.white

# == PUBLIC METHODS ==

# == PRIVATE METHODS ==

# == SIGNAL HANDLERS ==
func _on_player_dashed(vector: Vector2) -> void:
	_velocity.x = dash_speed * vector.x


func _on_player_hit_boss() -> void:
	_velocity.x = run_speed
	_red_frames = run_length


