extends Node2D

@onready var choice_button_scn = preload("res://scenes/choice_button.tscn")

var choice_buttons: Array[Button] = []

func clear_dialogue_box():
	get_node("VBoxContainer/Text").text = ""
	for choice in choice_buttons:
		$VBoxContainer/HBoxContainer/VBoxContainer.remove_child(choice)
	choice_buttons = []
	
func add_text(text: String):
	get_node("VBoxContainer/Text").text = text
	pass

func add_choice(choice_text: String):
	var button_obj: ChoiceButton = choice_button_scn.instantiate()
	var button_label = button_obj.get_child(0)
	#button_label.size.x = $VBoxContainer/HBoxContainer/VBoxContainer.size.x
	button_label.text = "-" + choice_text
	button_obj.custom_minimum_size.x = button_label.size.x
	button_obj.custom_minimum_size.y = button_label.size.y
	button_obj.choice_index = choice_buttons.size()
	choice_buttons.push_back(button_obj)
	#print(button_obj.custom_minimum_size.x)
	#print(button_label.size)
	button_obj.custom_minimum_size.y = 8
	button_obj.choice_selected.connect(_on_choice_selected)
	$VBoxContainer/HBoxContainer/VBoxContainer.add_child(button_obj)
	#print(button_label.size)
	#await get_tree().process_frame
	$VBoxContainer/HBoxContainer/VBoxContainer.get_child(button_obj.choice_index).custom_minimum_size.y = $VBoxContainer/HBoxContainer/VBoxContainer.get_child(button_obj.choice_index).get_child(0).size.y
	#print(first_button.size)
	#print($VBoxContainer/HBoxContainer/VBoxContainer.size)
	
func _on_choice_selected(choice_index: int):
	($"../EzDialogue" as EzDialogue).next(choice_index)
	pass





