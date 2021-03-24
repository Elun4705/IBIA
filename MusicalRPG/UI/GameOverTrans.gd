extends CanvasLayer

<<<<<<< HEAD
# The pupose of this scene is to change to the gameover scene.
=======
# The pupose of this scene is to change to the gameover scene, in which score
# and clsing of the game will occur.
>>>>>>> 359a0628a073ae86a0d78b7de5de3225a25ac6d0

signal scene_changed()

onready var animation_Player = $AnimationPlayer
onready var black = $Control/Black

var delay = 0.4
var delay_boss = 2.0
	
# The timer makes the transition more fluent, then plays the fade, and when it's
# finished changes the scene and it becomes the gameover scene

# This changes the scene when the player is defeated.
func _on_PlayerStats_no_health():
	yield(get_tree().create_timer(delay), "timeout")
	animation_Player.play("Fade")
	yield(animation_Player, "animation_finished")
	# Exception Handling on whether the scene can be changed or not
	# If pass, then the scene changes, else it terminates the program
	assert(get_tree().change_scene("res://UI/Gameover.tscn") == OK)
	animation_Player.play_backwards("Fade")
	yield(animation_Player, "animation_finished")
	emit_signal("scene_changed")

# This chnages the scene for when the boss is defeated
func _on_Stats_no_health():
	animation_Player.play("Fade")
	yield(animation_Player, "animation_finished")
<<<<<<< HEAD
	assert(get_tree().change_scene("res://UI/GameOver.tscn") == OK)
=======
	assert(get_tree().change_scene("res://UI/Gameover.tscn") == OK)
>>>>>>> 359a0628a073ae86a0d78b7de5de3225a25ac6d0
	animation_Player.play_backwards("Fade")
	yield(animation_Player, "animation_finished")
	emit_signal("scene_changed")
