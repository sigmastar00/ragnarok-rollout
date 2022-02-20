extends Node
## Class documentation.


# == SIGNALS ==

# == ENUMS ==

# == CONSTANTS ==

# == EXPORTED VARIABLES ==

# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==

# == ONREADY VARIABLES ==

# == BUILT-IN VIRTUAL METHODS ==

func _init()  -> void:
	pass


func _ready()  -> void:
	pass


# == PUBLIC METHODS ==
func is_current_scene(scene: Node) -> bool:
	return scene.get_tree().current_scene == scene

# == PRIVAE METHODS ==

# == SIGNAL HANDLERS ==


