extends CanvasLayer

onready var score = $Label
onready var timer = $Timer
onready var heart_points = $"/root/PlayerStats"
#var total_points = heart_points.health

func _ready():
	#score.visible = false
	#timer.start(4.0)
	pass

#func _on_Timer_timeout():
	#score.visible = true
	#score.text = "Your Score = " + str(total_points)
