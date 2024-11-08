extends Panel

# создаём массив ВСЕХ дочерних элементов, чтобы далее по индексу их брать
@export var texture : Texture2D 
@onready var camera_2d = get_tree().get_first_node_in_group('Camera')
@onready var object_slot = $"../.."

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureRect.texture = texture
	$TextureRect.expand_mode = 1
	$TextureRect.size = $".".size
	pass # Replace with function body.

func _get_drag_data(at_position):
	
	var preview = Control.new()
	var preview_texture = TextureRect.new()
	preview_texture.texture = $TextureRect.texture
	preview_texture.expand_mode = 1
	preview_texture.size = $".".size
	preview.add_child(preview_texture)
	set_drag_preview(preview)
	preview_texture.global_position = get_global_mouse_position()
	return [$TextureRect.texture,$"."]
	
func _can_drop_data(at_position, data):
	return data[0] is Texture2D

func _drop_data(at_position, data):
	print("Сбросил")
	#Поменять местами текстуры
	var panel = data[1]
	print(data[1].get_child(0).texture)
	print(data[0])
	print(panel.get_child(0).texture)#откуда, текстура1 до смены
	panel.get_child(0).texture = $TextureRect.texture
	print(panel.get_child(0).texture)#куда, текстура1 после смены
	#data[1].get_child(0) = $TextureRect.texture
	print(data[0])
	$TextureRect.texture = data[0]
	texture = $TextureRect.texture
	$TextureRect.size = $".".size
	object_slot.panels_changed.emit()
	
	




