extends CharacterBody2D

#------------------------Константы---------------------



#------------------------Он реди ссылки на дочерние ноды---------------------

@onready var animated_sprite = $AnimatedSprite2D

var x_axis = Input.get_axis("ui_left","ui_right")
var y_axis = Input.get_axis("ui_up","ui_down")
var input := Vector2i(x_axis,y_axis)
var speed = 90.0
 


func _process(delta):
	
	
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
		speed = 70
	else:
		speed = 90
	

	print(input * speed * delta_time)
	position += (input * speed * delta_time)
	
