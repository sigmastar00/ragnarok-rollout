extends Popup
## Class documentation.

# == SIGNALS ==

# == ENUMS ==

# == CONSTANTS ==

# == EXPORTED VARIABLES ==

# == PUBLIC VARIABLES ==

# == PRIVATE VARIABLES ==

# == ONREADY VARIABLES ==

# == BUILT-IN VIRTUAL METHODS ==
func _init() -> void:
	pass


func _ready() -> void:
	if Utils.is_current_scene(self):
		popup()
		
	


# == PUBLIC METHODS ==

# == PRIVATE METHODS ==

# == SIGNAL HANDLERS ==
func _on_ViewCredits_pressed() -> void:
	$CreditsScreen.popup()


func _on_RestartButton_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene("res://world/World.tscn")


func _on_ResumeButton_pressed() -> void:
	hide()
	get_tree().paused = false
