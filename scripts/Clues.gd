extends VBoxContainer

var clue_array = []
const clue = preload("res://scenes/CluesTest.tscn")
const clue2 = preload("res://scenes/ClueTest2.tscn")

func _ready():
	clue_array.append(clue)
	clue_array.append(clue2)
	
	
func _on_button_pressed():
	if not clue_array.is_empty():
		$GridContainer.add_child(clue_array.pop_front().instantiate())
	
