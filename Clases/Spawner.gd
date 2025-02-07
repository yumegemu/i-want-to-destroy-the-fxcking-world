class_name Spawner
extends Node3D

@onready var timer_spawn = $TimerSpawn

@export() var enemy = preload("res://Escenas/Asteroids/Asteroide1.tscn")

var x1 :float = 0
var y1 :float = 0

func _ready():
	pass

func _on_timer_spawn_timeout() -> void:
	spaw_enemy()
	#spaw_enemy_chico()

func spaw_enemy():
	var newEnemy = enemy.instantiate()

	randomSinRepeticion()

	newEnemy.position = Vector3(x1,y1,-17)
	get_parent().call_deferred("add_child", newEnemy)
	

func randomSinRepeticion():
	var xOld = x1
	var yOld = y1
	
	x1 = random()
	y1 = random()
	
	while xOld == x1 and yOld == y1:
		x1 = random()
		y1 = random()
		

func random() -> float:
	return randi_range(-2, 2)

func randomSprite() -> int:
	return randi_range(0, 2)
