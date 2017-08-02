extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var gameManager = get_node("/root/GameManager")

func _ready():
	get_tree().set_pause(false)
	for x in range(0, gameManager.get_level()):
		get_node("CanvasLayer").get_node(str(x + 1)).set_hidden(false)


func _on_1_pressed():
	get_tree().change_scene("Scenes/Levels/Level1.tscn")


func _on_2_pressed():
	get_tree().change_scene("Scenes/Levels/Level2.tscn")


func _on_3_pressed():
	get_tree().change_scene("Scenes/Levels/Level3.tscn")


func _on_4_pressed():
	get_tree().change_scene("Scenes/Levels/Level4.tscn")


func _on_5_pressed():
	get_tree().change_scene("Scenes/Levels/Level5.tscn")


func _on_6_pressed():
	get_tree().change_scene("Scenes/Levels/Level6.tscn")


func _on_7_pressed():
	get_tree().change_scene("Scenes/Levels/Level7.tscn")


func _on_8_pressed():
	get_tree().change_scene("Scenes/Levels/Level8.tscn")


func _on_9_pressed():
	get_tree().change_scene("Scenes/Levels/Level9.tscn")


func _on_10_pressed():
	get_tree().change_scene("Scenes/Levels/Level10.tscn")
