extends Node

signal request_target()
var projectile = preload("res://sword.tscn")
export var spawn_timer = 5
var player_loc = Vector2()
var disabled = false

func _ready():
	$Timer.wait_time = spawn_timer
	print($Timer.wait_time)
	$Timer.start()
	
func spawn_projectile(targ):
	var spawned_sword = projectile.instance()
	$spawn_frame.add_child(spawned_sword)
	spawned_sword.set_loc($spawn_frame.position)
	spawned_sword.set_target(targ)
	#projectile.                          
	#function to make it move to the child

func disable():
	disabled = true
	
func enable():
	disabled = false

func spawn_with_target(targ):
	if not disabled:
		spawn_projectile(targ)
		$Timer.start()

func _on_Timer_timeout():
	emit_signal("request_target")
	
