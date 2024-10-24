extends StaticBody2D
const FRIGDE_DIALOGUE = preload("res://addons/frigde_dialogue.json")
@onready var interaction_area = $interaction_area
var dialogue_scene = preload("res://scenes/dialogue_box.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_interact():
	var dialogue = dialogue_scene.instantiate()
	dialogue.scale = Vector2(0.5,0.5)
	dialogue.position = Vector2(0,27)
	dialogue.dialogue_json = FRIGDE_DIALOGUE
	if $"../CharacterBody2D/Camera2D".get_child_count()>1:
		$"../CharacterBody2D/Camera2D".get_child(1).queue_free()
		print($"../CharacterBody2D/Camera2D".get_child_count())
	else:
		print('here')
		$"../CharacterBody2D/Camera2D".add_child(dialogue)
		print($"../CharacterBody2D/Camera2D".get_child_count())
	
	print("Тут пусто")
