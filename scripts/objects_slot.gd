extends Panel

@onready var all_objects = $TextureRect.get_children()
@onready var slot_dict = {}
@onready var true_slot_dict = {}
@onready var first_icon_texture = preload("res://icon.svg")
@onready var second_icon_texture = preload("res://assets/puzzle/child.webp")
signal panels_changed
# Called when the node enters the scene tree for the first time.
func _ready():
	for slot in all_objects:
		slot_dict[slot.name] = slot.texture
		true_slot_dict[slot.name] = "none"
	pass # Replace with function body.
	true_slot_dict["Panel"] = first_icon_texture
	true_slot_dict["Panel2"] = second_icon_texture
	true_slot_dict["Panel3"] = first_icon_texture
	true_slot_dict["Panel4"] = second_icon_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




#func _on_panels_changed():
	#for slot in all_objects:
		#slot_dict[slot.name] = slot.texture
		##if slot.texture:
			##print(slot.texture)
	#if slot_dict == true_slot_dict:
		##for slot in all_objects:
			##slot.disabled = true
		#print("Головоломка решена")
	#
	##print($TextureRect/Panel2.texture)
	##print("Поменялось")
	#pass # Replace with function body.


func _on_button_pressed():
	for slot in all_objects:
		slot_dict[slot.name] = slot.texture
		#if slot.texture:
			#print(slot.texture)
	if slot_dict == true_slot_dict:
		#for slot in all_objects:
			#slot.disabled = true
		print("Головоломка решена")
	
	#print($TextureRect/Panel2.texture)
	#print("Поменялось")
	pass # Replace with function body.
