extends Control
## Class documentation.

# == SIGNALS ==
signal revive_clicked

# == ENUMS ==

# == CONSTANTS ==

# == EXPORTED VARIABLES ==
export var full_heart_color: Color
export var empty_heart_color: Color

var health: int setget set_health
var stars: int setget set_stars

# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==

# == ONREADY VARIABLES ==
onready var _health_container := $StatusPanel/VBoxContainer/HealthContainer as HBoxContainer
onready var _stars_label := $StarsPanel/HBoxContainer/StarLabel as Label
onready var _death_text := $DeathText

# == BUILT-IN VIRTUAL METHODS ==
func _init() -> void:
	pass


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	set_stars(GameState.stars)


func _input(event: InputEvent) -> void:
	if _death_text.visible and event.is_action_pressed("dash"):
		_death_text.visible = false
		emit_signal("revive_clicked")


# == PUBLIC METHODS ==
func show_death_text() -> void:
	_death_text.visible = true

func set_health(amount: int) -> void:
	health = amount
	for i in range(_health_container.get_child_count()):
		var heart_image := _health_container.get_child(i) as ColorRect
		if i + 1 <= health:
			heart_image.color = full_heart_color
		else:
			heart_image.color = empty_heart_color


func set_stars(amount: int) -> void:
	stars = amount
	_stars_label.text = "x %d" % stars

# == PRIVATE METHODS ==

# == SIGNAL HANDLERS ==
