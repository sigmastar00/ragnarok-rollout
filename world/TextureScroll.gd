extends Sprite
## Class documentation.

# == SIGNALS ==

# == ENUMS ==

# == CONSTANTS ==

# == EXPORTED VARIABLES ==
export var scroll_speed: float

# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==

# == ONREADY VARIABLES ==

# == BUILT-IN VIRTUAL METHODS ==
func _init() -> void:
	pass


func _ready() -> void:
	pass
	
	
func _process(delta: float) -> void:
	region_rect.position.x += delta * scroll_speed


# == PUBLIC METHODS ==

# == PRIVATE METHODS ==

# == SIGNAL HANDLERS ==
