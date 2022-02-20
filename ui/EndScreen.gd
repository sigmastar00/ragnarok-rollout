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
	var max_stars := GameState.max_stars
	var star_percent := float(num_stars) / max_stars
	var star_rank: int
	if star_percent >= 0.9:
		star_rank = 3
	elif star_percent >= 0.7:
		star_rank = 2
	elif star_percent >= 0.5:
		star_rank = 1
	else:
		star_rank = 0
	
	var time_rank: int
	if time_ms <= (40 * 1000):
		time_rank = 3
	elif time_ms <= (60 * 1000):
		time_rank = 2
	elif time_ms <= (120 * 1000):
		time_rank = 1
	else:
		time_rank = 0
		
	var total_rank := int(min(star_rank, time_rank))
	match total_rank:
		0:
			return "C"
		1:
			return "B"
		2:
			return "A"
		3: 
			return "S"
		_:
			assert(false)
			return "Unkown"
		
	

# == PRIVATE METHODS ==

# == SIGNAL HANDLERS ==


func _on_PlayagainButton_pressed() -> void:
	get_tree().change_scene("res://world/World.tscn")
