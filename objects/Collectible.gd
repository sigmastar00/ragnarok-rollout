extends Area2D
## Class documentation.


# == SIGNALS ==

# == ENUMS ==

# == CONSTANTS ==

# == EXPORTED VARIABLES ==
export var bobble_height: float
export var bobble_frequency: float

# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==

# == ONREADY VARIABLES ==
onready var _sprite := $Sprite as Sprite
onready var _collision := $CollisionShape2D as CollisionShape2D
onready var _particles := $Particles2D as Particles2D

# == BUILT-IN VIRTUAL METHODS ==

func _init()  -> void:
	pass


func _ready()  -> void:
	pass
	
	
func _process(_delta: float) -> void:
	var offset = bobble_height * sin(OS.get_ticks_msec() * bobble_frequency)
	_sprite.position.y = offset
	_collision.position.y = offset


# == PUBLIC METHODS ==

# == PRIVATE METHODS ==
func _disapear() -> void:
	monitoring = false
	_sprite.visible = false
	_particles.emitting = true
	GameState.stars += 1
	yield(get_tree().create_timer(1), "timeout")
	queue_free()

# == SIGNAL HANDLERS ==
func _on_Collectible_body_entered(body: Node) -> void:
	call_deferred("_disapear")
	

