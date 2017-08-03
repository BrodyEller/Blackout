extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var instructions = preload("../Assets/Images/Instructions.png")
var instructions_mobile = preload("../Assets/Images/Instructions_mobile.png")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	if OS.get_name() == "iOS"  || OS.get_name() == "Android":
		set_texture(instructions_mobile)
	else:
		set_texture(instructions)
