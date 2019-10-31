#StartMenu.gd
extends Control



func _on_StartGameButton_pressed():
	get_tree().change_scene("World.tscn")
	pass # Replace with function body.


func _on_QuitGameButton_pressed():
	get_tree().quit()
