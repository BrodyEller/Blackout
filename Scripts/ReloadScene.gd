extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Restart_pressed():
	get_tree().reload_current_scene()
	get_tree().set_pause(false)
