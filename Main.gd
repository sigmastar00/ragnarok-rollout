extends Node2D
## Class documentation.

# == SIGNALS ==

# == ENUMS ==

# == CONSTANTS ==

# == EXPORTED VARIABLES ==

# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==
var _respawn_point: Vector2
var _start: float
var _total_length: float

# == ONREADY VARIABLES ==
onready var _ui := $CanvasLayer/GameUI as Control
onready var _player := $Player as KinematicBody2D
onready var _finish := $FinishLine

# == BUILT-IN VIRTUAL METHODS ==
func _init() -> void:
	pass


func _ready() -> void:
	GameState.reset()
	_respawn_point = _player.position
	_start = _respawn_point.x
	_total_length = _finish.position.x - _start
	_count_max_stars()


func _process(_delta: float) -> void:
	_ui.health = _player.health
	var progress := (_player.position.x - _start) / _total_length
	_ui.progress = progress * 100
	


# == PUBLIC METHODS ==

# == PRIVATE METHODS ==
func _count_max_stars() -> void:
	var count := 0
	for child in $Stars.get_children():
		count += child.num_stars
	GameState.max_stars = count

# == SIGNAL HANDLERS ==
func _on_Player_player_died(player: KinematicBody2D) -> void:
	_ui.show_death_text()
	GameState.stars = int(GameState.stars * 0.75)


func _on_GameUI_revive_clicked() -> void:
	_player.respawn(_respawn_point)


func _on_Checkpoint_activated(checkpoint: Area2D) -> void:
	_respawn_point = checkpoint.position
	_player.restore_health()


func _on_FinishLine_activated(checkpoint) -> void:
	GameState.stop_level_timer()
	get_tree().change_scene("res://ui/EndScreen.tscn")
	
