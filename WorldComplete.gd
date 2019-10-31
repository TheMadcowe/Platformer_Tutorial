# WorldComplete.gd
extends Area2D

export(String, FILE, "*.tscn") var next_world
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene(next_world)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
