extends Window

@onready var label = $VBoxContainer/Label



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	label.text = "Я разработчик"
	pass # Replace with function body.


func _on_button_2_pressed():
	label.text = "Я Бездарь"
	pass # Replace with function body.
