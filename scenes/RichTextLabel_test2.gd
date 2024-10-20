extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	text = "Я кажется поторопился, не хотел отвлекать вас от дел, если что-то вспомните вот мой номер, Я кажется поторопился, не хотел отвлекать вас от дел, если что-то вспомните вот мой номер."
	#size.x = 256
	print(text)
	await get_tree().process_frame
	print(size)
	pass # Replace with function body.


func _on_button_2_pressed():
	text = "hello"
	await get_tree().process_frame
	print(size)
	pass # Replace with function body.
