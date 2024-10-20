extends StaticBody2D
const DIALOGUE = preload("res://addons/female_dialogue.json")
@onready var interaction_area = $interaction_area
var dialogue_scene = preload("res://scenes/dialogue_box.tscn")
#Потом нужно сделать шаблон для диалогов
# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_interact():
	Global.start_dialogue('start',DIALOGUE,'start_dopros')
	

func restart_dialogue():
	print('hello')
	var dialogue2 = dialogue_scene.instantiate()
	dialogue2.scale = Vector2(0.5,0.5)
	dialogue2.position = Vector2(0,27)
	dialogue2.dialogue_json = DIALOGUE
	$"../CharacterBody2D/Camera2D".add_child(dialogue2)
