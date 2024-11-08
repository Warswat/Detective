extends Panel

@onready var all_objects = $TextureRect.get_children()
@onready var slot_dict = {}

signal panels_changed
# Called when the node enters the scene tree for the first time.
func _ready():
	for slot in all_objects:
		slot_dict[slot.name] = slot.texture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_panels_changed():
	for slot in all_objects:
		slot_dict[slot.name] = slot.texture
	#print(slot_dict)
	#print("Поменялось")
	pass # Replace with function body.
