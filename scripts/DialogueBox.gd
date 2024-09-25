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
	button_obj.choice_index = choice_buttons.size()
	choice_buttons.push_back(button_obj)
	button_obj.text = "-" + choice_text
	button_obj.choice_selected.connect(_on_choice_selected)
	$VBoxContainer/HBoxContainer/VBoxContainer.add_child(button_obj)
	
func _on_choice_selected(choice_index: int):
	print(choice_index)
	($"../EzDialogue" as EzDialogue).next(choice_index)
	pass





