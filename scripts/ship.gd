extends Area2D

const LASER_SCENE = preload("res://scenes/laser.tscn")

@export var speed = 100

signal ship_destroyed

var height = ProjectSettings.get_setting("display/window/size/viewport_height")

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		if global_position.y > 10:
			position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		if global_position.y < height - 10:
			position.y += speed * delta
	if Input.is_action_just_pressed("ui_accept"):
		var laser = LASER_SCENE.instantiate()
		var world = get_tree().current_scene
		world.add_child(laser)
		laser.position = position


func _on_area_entered(area):
	queue_free()
	area.queue_free()
	ship_destroyed.emit()
