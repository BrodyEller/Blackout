extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const car_speed = 2

var gas_cans_collected = 1
var timer = 30

onready var gameManager = get_node("/root/GameManager")

func _ready():
	get_node("BackgroundMusic").play()
	set_process(true)
	set_fixed_process(true)


func _process(delta):
	if Input.is_action_pressed("ui_up"):
		apply_impulse(Vector2(0, 0), Vector2(-car_speed * sin(get_rot()), -car_speed * cos(get_rot())))
	if Input.is_action_pressed("ui_down"):
		apply_impulse(Vector2(0, 0), Vector2(car_speed * sin(get_rot()), car_speed * cos(get_rot())))
	if Input.is_action_pressed("ui_left"):
		apply_impulse(Vector2(16, 0), Vector2(0, -car_speed/2))
		apply_impulse(Vector2(-16, 0), Vector2(0, car_speed/2))
	if Input.is_action_pressed("ui_right"):
		apply_impulse(Vector2(16, 0), Vector2(0, car_speed/2))
		apply_impulse(Vector2(-16, 0), Vector2(0, -car_speed/2))
		
func _fixed_process(delta):
	timer -= delta
	if timer <= 0:
		timer = 30
		remove_gas_can()
	get_node("CanvasLayer/Label").set_text("Fuel: " + str(int(timer)))

func _on_RigidBody2D_body_enter( body ):
	if body.is_in_group("GasCan"):
		body.get_owner().queue_free()
		add_gas_can()
	elif body.is_in_group("Buildings"):
		remove_gas_can()
	elif body.is_in_group("Flag"):
		if gameManager.get_level() < 10:
			gameManager.set_level(gameManager.get_level() + 1)
		get_node("CompleteCanvasLayer").get_node("Complete").set_hidden(false)
		get_tree().set_pause(true)
		
		
func remove_gas_can():
	gas_cans_collected -= 1
	get_node("SamplePlayer2D").play("GasCanLoss")
	if get_node("CanvasLayer/GasCan4").is_hidden() == false:
		get_node("CanvasLayer/GasCan4").set_hidden(true)
	elif get_node("CanvasLayer/GasCan3").is_hidden() == false:
		get_node("CanvasLayer/GasCan3").set_hidden(true)
	elif get_node("CanvasLayer/GasCan2").is_hidden() == false:
		get_node("CanvasLayer/GasCan2").set_hidden(true)
	elif get_node("CanvasLayer/GasCan1").is_hidden() == false:
		get_node("CanvasLayer/GasCan1").set_hidden(true)
	
	if gas_cans_collected == 0:
		get_tree().set_pause(true)
		get_node("LossCanvasLayer/Control").set_hidden(false)
		
func add_gas_can():
	gas_cans_collected += 1
	get_node("SamplePlayer2D").play("GasCanPickup")
	timer = 30
	get_node("CanvasLayer/GasCan" + str(gas_cans_collected)).set_hidden(false)