extends NinePatchRect

signal restart()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_retry_pressed():
	emit_signal("restart")


func _on_exit_pressed():
	get_tree().quit()
