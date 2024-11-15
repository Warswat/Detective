extends Control

@onready var sub_viewport = $SubViewport

# Called when the node enters the scene tree for the first time.
func _ready():
	sub_viewport.set_update_mode(SubViewport.UPDATE_WHEN_PARENT_VISIBLE)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$SubViewport/MeshInstance3D.rotation.y += 1 * delta
	pass
