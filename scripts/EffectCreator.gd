extends Node2D

@export var EFFECT_SCENE : PackedScene

var height = ProjectSettings.get_setting("display/window/size/viewport_height")
var width = ProjectSettings.get_setting("display/window/size/viewport_width")

func _exit_tree():
	# If there is no effect, exit the function
	if not EFFECT_SCENE is PackedScene: return
	# check if effect is off screen. if so, don't play the effect.
	if global_position.x < 0 or global_position.x > width: return
	if global_position.y < 0 or global_position.y > height: return
	# get root node
	var world = get_tree().current_scene
	# create effect
	var effect = EFFECT_SCENE.instantiate()
	# add effect to the scene
	world.add_child.call_deferred(effect)
	# move the effect to the same position as the scene
	effect.global_position = global_position
