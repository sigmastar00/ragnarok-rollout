tool
class_name StarLine
extends Line2D
## Class documentation.


# == SIGNALS ==

# == ENUMS ==

# == CONSTANTS ==
const Collectible := preload("res://objects/Collectible.tscn")
const star_texture := preload("res://objects/collect.png")

# == EXPORTED VARIABLES ==
export var num_stars: int setget set_num_stars

# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==

# == ONREADY VARIABLES ==

# == BUILT-IN VIRTUAL METHODS ==

func _init()  -> void:
	pass


func _ready()  -> void:
	if not Engine.editor_hint:
		var points := star_points()
		for point in points:
			var collectible := Collectible.instance() as Node2D
			collectible.position = point + position
			get_parent().call_deferred("add_child", collectible)
		visible = false
		queue_free()


func _draw() -> void:
	update_configuration_warning()
	var points := star_points()
	draw_set_transform(Vector2.ZERO, 0, Vector2(0.5, 0.5))
	for point in points:
		draw_texture(star_texture, (point - (star_texture.get_size() / 4)) * 2)
	
	
func _get_configuration_warning() -> String:
	if points.size() != 2:
		return "There must be only 2 points in the line"
	elif num_stars <= 1:
		return "Need at least 2 stars"
	else:
		return ""


# == PUBLIC METHODS ==
func set_num_stars(amount: int) -> void:
	num_stars = amount
	update()


func star_points() -> PoolVector2Array:
	var result := PoolVector2Array()
	var start := points[0]
	var stop := points[1]

	for i in range(num_stars):
		var step := float(i) / (num_stars - 1)
		result.push_back((step * (stop - start)) + start)

	return result

# == PRIVATE METHODS ==

# == SIGNAL HANDLERS ==


