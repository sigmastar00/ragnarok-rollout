extends Area2D
## Class documentation.

# == SIGNALS ==
signal activated(checkpoint)

# == ENUMS ==

# == CONSTANTS ==

# == EXPORTED VARIABLES ==

# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==
var _active := false

# == ONREADY VARIABLES ==
onready var _animator := $AnimationPlayer as AnimationPlayer

# == BUILT-IN VIRTUAL METHODS ==
func _init() -> void:
	pass


func _ready() -> void:
	_animator.play("RESET")


# == PUBLIC METHODS ==

# == PRIVATE METHODS ==

# == SIGNAL HANDLERS ==
func _on_Checkpoint_body_entered(body: Node) -> void:
	if _active:
		return

	_animator.play("Activate")
	_active = true
	emit_signal("activated", self)
