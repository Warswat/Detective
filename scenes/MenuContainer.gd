extends VBoxContainer



func _on_button_pressed():
	Global.pause()


func _on_button_3_pressed():
	get_tree().quit()
