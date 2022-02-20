extends Node
## Class documentation.

# == SIGNALS ==

# == ENUMS ==

# == CONSTANTS ==

# == EXPORTED VARIABLES ==

# == PUBLIC VARIABLES ==
var stars: int = 0
var level_timer: int = 0

# == PRIVATE VARIABLES ==
var _timer_active := false
var _delta_start := 0

# == ONREADY VARIABLES ==

# == BUILT-IN VIRTUAL METHODS ==
func _init() -> void:
	pass


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if _timer_active:
		level_timer = OS.get_ticks_msec() - _delta_start


# == PUBLIC METHODS ==
func start_level_timer() -> void:
	if not _timer_active:
		_delta_start = OS.get_ticks_msec()
		_timer_active = true


func stop_level_timer() -> void:
	_timer_active = false
	

func level_timer_text() -> String:
	var seconds = level_timer / 1000
	var milliseconds = level_timer - (seconds * 1000)
	return "%d:%03d" % [seconds, milliseconds]
	
	
func reset() -> void:
	stars = 0
	level_timer = 0
	_timer_active = false

# == PRIVATE METHODS ==

# == SIGNAL HANDLERS ==
