extends KinematicBody2D


# This preloads the 'FaintEffeft.tscn' in order to be much quicker
const FaintEffect = preload("res://Effects/FaintEffect.tscn")

# Starts 'switch' like operation aka State machine.
# A keyword used in gdscript for making a bunch of related constants.
# Simlar to that of 'Player.gd'.

enum {
	IDLE,
	ATTACK,
}

<<<<<<< HEAD
=======
signal add_points

>>>>>>> 359a0628a073ae86a0d78b7de5de3225a25ac6d0
# Sets the damage equal to the output from the hitboxes. 'Damage' = 1

onready var damage = HitBox

# State that is chose when the program is first run. Prevents the talus from
# automaticly attaking at the start

var state = IDLE

# 'from_position' plays any audio at '0.0', so from the start
# 'flag' is being used to indicate on wheter the boss/Talus reaches half health
# A two dimesional array is being used to store the pssible states of the boss
var from_position = 0.0
var flag = false
var array_states = [1, 2]

# This class is inheriting all of the functionality of the following nodes
onready var sprite = $AnimationPlayer
onready var stats = $Stats
onready var hurtBox = $HurtBox
onready var animationPlayer = $AnimationPlayer
onready var bossAttack = $BossAttack
onready var bossDanger = $BossDanger
onready var bossMid = $BossMid
onready var bossStart = $BossAttack


<<<<<<< HEAD

=======
>>>>>>> 359a0628a073ae86a0d78b7de5de3225a25ac6d0
# The _ready() function is called when the node, and all its children, enters 
# the active scene. - Not a constructor
func _ready():
	bossStart.play(from_position)

# warning-ignore:unused_argument
func _physics_process(delta):

	match state:
		IDLE:
			sprite.play("Idle")

		ATTACK:
			sprite.play("Attack")

# Picks a random state from the state machine, unlike the player and bat, I used
# a manual random generator machine. It's only needed twice so I only instanced
# were it's being used for code readability
func pick_random_state():
	var random_state = array_states[randi() % array_states.size()]
	if random_state == 1:
		if flag == false:
			bossStart.play(from_position)
		elif flag == true:
			bossMid.play(from_position)
		state = IDLE
	if random_state == 2:
		state = ATTACK

# warning-ignore:unused_argument
func _on_HurtBox_area_entered(area):
	stats.health -= damage.damage
	hurtBox.create_hit_effect()
	hurtBox.start_invincibilty(1.0)

# Frees the Talus scene or visual deletes it
func _on_Stats_no_health():
	emit_signal("add_points")
	queue_free()
	var faintEffect = FaintEffect.instance()
	get_parent().add_child(faintEffect)
	faintEffect.global_position = global_position

# Following signals are receved to chose the next possible state

func _on_BossStart_finished():
	pick_random_state()


func _on_BossAttack_finished():
	pick_random_state()


func _on_BossDanger_finished():
	pick_random_state()

# warning-ignore:unused_argument
func _on_Stats_mid_health():
	self.flag = true


func _on_BossMid_finished():
	pick_random_state()
