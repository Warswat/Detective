extends Window

@onready var main = $"../../../../"

@onready var clues = $Clues
@onready var files = $Files
@onready var label = $Label
@onready var menu = $Menu



func _on_resume_pressed():
	main.pauseMenu()


func _on_quit_pressed():
	get_tree().quit()


func _on_clues_pressed():
	clues.show()
	files.hide()
	label.hide()
	menu.hide()


func _on_files_pressed():
	clues.hide()
	files.show()
	label.hide()
	menu.hide()
	


func _on_prikol_pressed():
	clues.hide()
	files.hide()
	label.show()
	menu.hide()


func _on_menu_pressed():
	clues.hide()
	files.hide()
	label.hide()
	menu.show()
