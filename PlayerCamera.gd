extends Camera2D
## Class documentation.


# == SIGNALS ==

# == ENUMS ==

# == CONSTANTS ==

# == EXPORTED VARIABLES ==

# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==

# == ONREADY VARIABLES ==
onready var _base_offset := offset
onready var _tween := $Tween as Tween

# == BUILT-IN VIRTUAL METHODS ==

func _init()  -> void:
	pass


func _ready()  -> void:
	pass


# == PUBLIC METHODS ==
func shake(shake_vector: Vector2) -> void:
	_tween.interpolate_property(
		self, 
		"offset",
		_base_offset + shake_vector, 
		_base_offset, 
		1,
		Tween.TRANS_ELASTIC, 
		Tween.EASE_OUT
	)
	_tween.start()

# == PRIVAE METHODS ==

# == SIGNAL HANDLERS ==
