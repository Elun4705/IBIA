extends Node2D

# The first GUI that the cleint will come across.
# Introduce the texture of the simulation.

func _input(event):
	# The 'event.pressed' targets any input on the StartMenu Scene.
	# If true, and the action's state is pressed. it will change scenes to
	# LoadingScreen.
	if event is InputEventKey:
		if event.pressed:
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://UI/LoadingScreen.tscn")
