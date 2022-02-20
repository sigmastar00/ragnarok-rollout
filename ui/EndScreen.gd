extends Panel
## Class documentation.

# == SIGNALS ==

# == ENUMS ==

# == CONSTANTS ==

# == EXPORTED VARIABLES ==

# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==

# == ONREADY VARIABLES ==
onready var _end_text := $VBoxContainer/EndText as RichTextLabel

# == BUILT-IN VIRTUAL METHODS ==
func _init() -> void:
	pass


func _ready() -> void:
	var time_text = GameState.level_timer_text()
	var rank = compute_rank(GameState.level_timer, GameState.stars)
	_end_text.bbcode_text = _end_text.bbcode_text % [time_text, GameState.stars, rank]


# == PUBLIC METHODS ==
func compute_rank(time_ms: int, num_stars: int) -> String:
	return "S"

# == PRIVATE METHODS ==

# == SIGNAL HANDLERS ==


func _on_PlayagainButton_pressed() -> void:
	get_tree().change_scene("res://world/World.tscn")
