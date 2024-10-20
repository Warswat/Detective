extends Window


var interrogation_state = 'start'
#@onready var female_npc = get_tree().get_first_node_in_group('npc')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	Global.start_dialogue(interrogation_state,preload("res://addons/female_dialogue.json"))
	queue_free()
	pass # Replace with function body.
