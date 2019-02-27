extends KinematicBody2D

var current_speed = 0
var max_speed = 25000
var velocity = Vector2()
var lives = 3
var disabled = false
signal take_damage()

func disable():
	disabled = true
	
func enable():
	disabled = false
	
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if not disabled:
		velocity = Vector2()
		if Input.is_action_pressed("move_up"):
			velocity.y = -1
		if Input.is_action_pressed("move_down"):
			velocity.y = 1
		if Input.is_action_pressed("move_left"):
			velocity.x = -1
		if Input.is_action_pressed("move_right"):
			velocity.x = 1
		move_and_slide(velocity.normalized() * delta * accelerate(delta))

func accelerate(delta):
	if velocity.x == 0 and velocity.y == 0:
		current_speed = 0
		return current_speed
	if current_speed < max_speed:
		current_speed += 100000 * delta
		return current_speed
	else:
		return max_speed

func take_damage():
	$AnimationPlayer.play("take_damage")
	emit_signal("take_damage")