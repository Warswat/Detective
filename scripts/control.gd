extends Control

@onready var window = $Window

var paused = false


func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		pauseMenu()
		
		
func pauseMenu():
	if paused:
		window.hide()
		Engine.time_scale = 1
	else:
		window.show()
		Engine.time_scale = 0
		
	paused = !paused
