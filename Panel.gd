extends Panel

@onready var panel = $"."
@onready var h_box_container = $VBoxContainer/HBoxContainer
@onready var button_list = h_box_container.get_children()
@onready var button_4 = $VBoxContainer/HBoxContainer/Button4
@onready var button = $VBoxContainer/HBoxContainer/Button
@onready var button_2 = $VBoxContainer/HBoxContainer/Button2
@onready var button_3 = $VBoxContainer/HBoxContainer/Button3


var menu_container = preload("res://scenes/MenuContainer.tscn")
var clues_container = preload("res://scenes/Clues_container.tscn")
var files_container = preload("res://scenes/Files_container.tscn")
var smthng_container = preload("res://scenes/Smthng_container.tscn")

func _ready():
	for button in button_list:
		button.custom_minimum_size.x = panel.size.x / button_list.size() * 0.95
		button.custom_minimum_size.y = panel.size.y * 0.2
	$VBoxContainer.add_child(menu_container.instantiate())
	button_4.disabled = true


func _on_button_4_pressed():
	for button in button_list:
		button.disabled = false
	$VBoxContainer.get_child(1).queue_free()
	$VBoxContainer.add_child(menu_container.instantiate())
	button_4.disabled = true


func _on_button_pressed():
	for button in button_list:
		button.disabled = false
		$VBoxContainer.get_child(1).queue_free()
	$VBoxContainer.add_child(clues_container.instantiate())
	button.disabled = true
	

func _on_button_2_pressed():
	for button in button_list:
		button.disabled = false
	$VBoxContainer.get_child(1).queue_free()
	$VBoxContainer.add_child(files_container.instantiate())
	button_2.disabled = true


func _on_button_3_pressed():
	for button in button_list:
		button.disabled = false
	$VBoxContainer.get_child(1).queue_free()
	$VBoxContainer.add_child(smthng_container.instantiate())
	button_3.disabled = true
