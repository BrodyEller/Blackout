extends Node2D

var level = 1

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func get_level():
	return level
	
func set_level(var value):
	level = value