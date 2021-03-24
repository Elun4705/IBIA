extends AnimatedSprite

# The _ready() function is called when the node, and all its children, enters 
# the active scene. - Not a constructor

<<<<<<< HEAD
func _ready():
	# Self here verifies the sprite that it's checking

	# Objects can have a set of signals defined here, _ready() connects to
	# animation finished
	
	# Play plays the animation thats being refered to in this case Animate
	
	# warning-ignore:return_value_discarded
	connect("animation_finished", self, "_on_AnimatedSprite_animation_finished")
	frame = 0
	play("Animate")

func _on_AnimatedSprite_animation_finished():
	
=======
# The _ready() function is called when the node, and all its children, enters 
# the active scene. - Not a constructor

# when active, it plays the grass effect
func _ready():
	animatedSprite.frame = 0;
	
	# Play plays the animation thats being refered to in this case Animate
	animatedSprite.play("Animate")

func _on_AnimatedSprite_animation_finished():
>>>>>>> 359a0628a073ae86a0d78b7de5de3225a25ac6d0
	# Frees a node and it's children - visually deletes them
	queue_free()
