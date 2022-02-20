extends Node2D
## Class documentation.

# == SIGNALS ==

# == ENUMS ==

# == CONSTANTS ==

# == EXPORTED VARIABLES ==

# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==
var _respawn_point: Vector2

# == ONREADY VARIABLES ==
onready var _ui := $CanvasLayer/GameUI as Control
onready var _player := $Player as KinematicBody2D

# == BUILT-IN VIRTUAL METHODS ==
func _init() -> void:
	pass


func _ready() -> void:
	GameState.reset()
	_respawn_point = _player.position
	_count_max_stars()


func _process(_delta: float) -> void:
	_ui.health = _player.health


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
	GameState.stars /= 2


func _on_GameUI_revive_clicked() -> void:
	_player.respawn(_respawn_point)


func _on_Checkpoint_activated(checkpoint: Area2D) -> void:
	_respawn_point = checkpoint.position
	_player.restore_health()


func _on_FinishLine_activated(checkpoint) -> void:
	GameState.stop_level_timer()
	get_tree().change_scene("res://ui/EndScreen.tscn")
	
