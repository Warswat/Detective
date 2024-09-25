extends CharacterBody2D

#------------------------Константы---------------------

const SPEED = 60.0

#------------------------Он реди ссылки на дочерние ноды---------------------

@onready var animated_sprite = $AnimatedSprite2D

var x_axis = Input.get_axis("ui_left","ui_right")
var y_axis = Input.get_axis("ui_up","ui_down")
var input := Vector2(x_axis,y_axis)


func _process(delta):
	# Add the gravity.
	
	move_character(delta)
	move_and_slide()


func move_character(delta_time : float):
	x_axis = Input.get_axis("ui_left","ui_right")
	y_axis = Input.get_axis("ui_up","ui_down")
	
	
	input = Vector2(x_axis,y_axis)
	
	if x_axis > 0:
		animated_sprite.flip_h = true
	if x_axis < 0:
		animated_sprite.flip_h = false
	
	if input.length() != 0:
		animated_sprite.animation = "move"
	else:
		animated_sprite.animation = "default"
	if input.length() > 1:
		input = input.normalized()
	
	position += input * SPEED * delta_time
