extends Node

var lives = 3
var score = 0

func _ready():
	$spawnA.enable()
	$spawnB.enable()
	$spawnC.enable()
	$spawnD.enable()
	$Node/KinematicBody2D.enable()
	update_labels()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func update_labels():
	$Sprite/Label.text = "lives: " + str(lives)
	update_score()

func _on_KinematicBody2D_take_damage():
	lives -= 1
	update_labels()
	if lives <= 0:
		game_over()

func game_over():
	print("game over!")
	$spawnA.disable()
	$spawnB.disable()
	$spawnC.disable()
	$spawnD.disable()
	$Node/KinematicBody2D.disable()
	$Sprite/Label.text = "Game over"
	$end_game.visible = true


func _on_spawnA_request_target():
	$spawnA.spawn_with_target($Node/KinematicBody2D.position)


func _on_spawnB_request_target():
	$spawnB.spawn_with_target($Node/KinematicBody2D.position)

func _on_spawnC_request_target():
	$spawnC.spawn_with_target($Node/KinematicBody2D.position)


func _on_spawnD_request_target():
	$spawnD.spawn_with_target($Node/KinematicBody2D.position)


func _on_NinePatchRect_restart():
	lives = 3
	score = 0
	$end_game.visible = false
	_ready()

func update_score():
	$Sprite/score.text = "score: " + str(score)

func _on_Timer_timeout():
	if not $end_game.visible:
		score += 1
		update_score()
