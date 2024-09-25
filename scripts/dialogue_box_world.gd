extends Node2D

@export var dialogue_json: JSON
@onready var state = {}

func _ready():
	($EzDialogue as EzDialogue).start_dialogue(dialogue_json,state)

func _on_ez_dialogue_dialogue_generated(response):
	$DialogueBox.clear_dialogue_box()
	
	$DialogueBox.add_text(response.text)
	for choice in response.choices:
		$DialogueBox.add_choice(choice)
	
