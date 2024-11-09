extends Node

var dialogue_scene = preload("res://scenes/dialogue_box.tscn")
@onready var camera_2d = get_tree().get_first_node_in_group('Camera')
var main_menu = preload("res://scenes/main_menu.tscn")
var paus = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		Global.pause()



func start_dialogue(inter_state,dialogue_json,inter_state_reset = 'start'):
	var dialogue = dialogue_scene.instantiate()
	dialogue.scale = Vector2(0.5,0.5)
	dialogue.position = Vector2(0,27)
	dialogue.interrogation_state = inter_state
	dialogue.interrogation_state_on_restart = inter_state_reset
	dialogue.dialogue_json = dialogue_json
	camera_2d.add_child(dialogue)
	pass


func pause():
	process_mode = Global.PROCESS_MODE_ALWAYS
	if paus:
		get_tree().paused = false
		print(get_tree().paused)
		camera_2d.get_child(0).queue_free()
	else:
		var main_menu_obj = main_menu.instantiate()
		camera_2d.add_child(main_menu_obj)
		get_tree().paused = true
	
	paus = !paus

	
