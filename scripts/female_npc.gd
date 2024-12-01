extends StaticBody2D
@export var dialogue_json: JSON
#const DIALOGUE = preload("res://addons/female_dialogue.json")
@onready var interaction_area = $interaction_area
var used = false
var dialogue_scene = preload("res://scenes/dialogue_box.tscn")
#@onready var animated_sprite = find_children("*","AnimatedSprite2D")[0]
#@onready var all_animations = animated_sprite.sprite_frames.get_animation_names()
#Потом нужно сделать шаблон для диалогов
# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_interact():
	#if "open" in all_animations and not used and not animated_sprite.is_playing():
		#animated_sprite.animation = "open"
		#animated_sprite.play()
		#used = true
	#elif "close" in all_animations and used and not animated_sprite.is_playing():
		#animated_sprite.animation = "close"
		#animated_sprite.play()
		#used = false
	#if find_children("*","AnimatedSprite2D"):
		#print("found")
	#print(animated_sprite.sprite_frames.get_animation_names())
	Global.start_dialogue('start',dialogue_json)
	

func restart_dialogue():
	print('hello')
	var dialogue2 = dialogue_scene.instantiate()
	dialogue2.scale = Vector2(0.5,0.5)
	dialogue2.position = Vector2(0,27)
	dialogue2.dialogue_json = dialogue_json
	$"../CharacterBody2D/Camera2D".add_child(dialogue2)
