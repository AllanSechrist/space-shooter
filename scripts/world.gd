extends Node2D

@onready var score_label = $ScoreLabel

var score = 0 :
	get:
		return score
	set(value):
		score = value
		score_label.text = "Score = " + str(score)


func _on_ship_ship_destroyed():
	# causes Godot to wait for 2 seconds before moving to the next
	# line of code. create_timer is a way to make a timer in code.
	await get_tree().create_timer(2.0).timeout
	var highscore = SaveAndLoad.load_highscore()
	# check if there is a highscore saved
	if highscore != null:
		# save the new score if it is higher than highscore
		if score > highscore:
			SaveAndLoad.save_highscore(score)
	else:
		# First highscore
		SaveAndLoad.save_highscore(score)
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
