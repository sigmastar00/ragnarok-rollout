extends Area2D
## Class documentation.

# == SIGNALS ==

# == ENUMS ==

# == CONSTANTS ==

# == EXPORTED VARIABLES ==

# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==

# == ONREADY VARIABLES ==
onready var _animator := $AnimationPlayer as AnimationPlayer

# == BUILT-IN VIRTUAL METHODS ==
func _init() -> void:
	pass


func _ready() -> void:
	pass


# == PUBLIC METHODS ==

# == PRIVATE METHODS ==

# == SIGNAL HANDLERS ==
func _on_Checkpoint_body_entered(body: Node) -> void:
	_animator.play("Activate")
