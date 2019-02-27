extends Node

var target = Vector2()
var move = false

func _ready():
	$AnimationPlayer.play("spawn")

func set_loc(loc):
	$Area2D.position = loc

func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		body.take_damage()

func set_target(target_in):
	target = target_in
	

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "spawn":
		$AnimationPlayer.play("spin")
		move = true
		target = (target - $Area2D.position).normalized()
		
func _process(delta):
	if move:
		#print(target)
		#print($Area2D.position)
		$Area2D.position += target * delta * 500



func _on_Timer_timeout():
	queue_free()
