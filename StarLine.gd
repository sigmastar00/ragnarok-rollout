class_name StarLine
extends Line2D
## Class documentation.


# == SIGNALS ==

# == ENUMS ==

# == CONSTANTS ==
const Collectible := preload("res://objects/Collectible.tscn")
const star_texture := preload("res://objects/collect.png")

# == EXPORTED VARIABLES ==
export var num_stars: int

# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==

# == ONREADY VARIABLES ==

# == BUILT-IN VIRTUAL METHODS ==

func _init()  -> void:
	pass


func _ready()  -> void:
	pass


# == PUBLIC METHODS ==
func star_points() -> PoolVector2Array:
	var result := PoolVector2Array()
	var start := points[0]
	var stop := points[1]
	
	return result

# == PRIVATE METHODS ==

# == SIGNAL HANDLERS ==


