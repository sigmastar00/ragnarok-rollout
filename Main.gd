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
	_ui.stars = 100
	_ui.health = 2
	
	_respawn_point = _player.position
	
	
func _process(_delta: float) -> void:
	_ui.health = _player.health


# == PUBLIC METHODS ==

# == PRIVATE METHODS ==

# == SIGNAL HANDLERS ==
func _on_Player_player_died(player: KinematicBody2D) -> void:
	_ui.show_death_text()


func _on_GameUI_revive_clicked() -> void:
	_player.respawn(_respawn_point)


func _on_Checkpoint_activated(checkpoint: Area2D) -> void:
	_respawn_point = checkpoint.position
