extends Node2D

@export var dialogue_json: JSON
@onready var state = {}
var stress = 10
@onready var camera_2d = get_tree().get_first_node_in_group('Camera')
@onready var stress_popup = preload("res://scenes/stress_window.tscn")
var interrogation_state = 'start'
var interrogation_state_on_restart = 'start'

#всегда со старта начинается, но если мы поменяем значение, то начнётся с другого места
func _ready():
	($EzDialogue as EzDialogue).start_dialogue(dialogue_json,state,interrogation_state)

func _on_ez_dialogue_dialogue_generated(response):
	$DialogueBox.clear_dialogue_box()
	
	$DialogueBox.add_text(response.text)
	for choice in response.choices:
		$DialogueBox.add_choice(choice)
	

func _on_ez_dialogue_custom_signal_received(value):
	if value.is_valid_int():
		stress += int(value)
		print('Текущее напряжение : ' + str(stress))
		if stress >= 100:
			pass
			var stress_popup_obj = stress_popup.instantiate()
			print(interrogation_state_on_restart)
			stress_popup_obj.dialogue_json = dialogue_json
			stress_popup_obj.interrogation_state = interrogation_state_on_restart
			camera_2d.add_child(stress_popup_obj)
	else:
		interrogation_state_on_restart = value
	pass # Replace with function body.

func restart_dialogue_from_interrogation(interrogation_state):
	($EzDialogue as EzDialogue).start_dialogue(dialogue_json,state,interrogation_state)


func _on_ez_dialogue_end_of_dialogue_reached():
	camera_2d.get_child(1).queue_free()
	pass # Replace with function body.
