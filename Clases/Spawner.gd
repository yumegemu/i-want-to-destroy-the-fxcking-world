class_name Spawner
extends Node3D

@onready var timer_spawn = $TimerSpawn

@export() var enemy = preload("res://Escenas/Asteroids/Asteroide1.tscn")

var x1 :float = 0
var y1 :float = 0
var x2 :float = 0
var y2 :float = 0

func _ready():
	pass

func _on_timer_spawn_timeout() -> void:
	spaw_enemy()
	#spaw_enemy_chico()

func spaw_enemy():
	var newEnemy = enemy.instantiate()

	randomSinRepeticion()

	newEnemy.position = Vector3(x1,y1,-10)
	get_parent().call_deferred("add_child", newEnemy)
	

func spaw_enemy_chico():
	var newEnemy = enemy.instantiate()

	randomChichoSinRepeticion()

	newEnemy.position = Vector3(x2,y2,-15)
	get_parent().call_deferred("add_child", newEnemy)

func randomSinRepeticion():
	var xOld = x1
	var yOld = y1
	
	x1 = random()
	y1 = random()
	
	while xOld == x1 and yOld == y1:
		x1 = random()
		y1 = random()
		
func randomChichoSinRepeticion():
	var xOld = x2
	var yOld = y2
	
	x2 = random_chico()
	y2 = random_chico()
	
	while xOld == x2 and yOld == y2:
		x2 = random_chico()
		y2 = random_chico()

func random() -> int:
	return randi_range(-2.5, 2.5) -0.5
	
func random_chico() -> int:
	return randi_range(-1, 1)
	
func randomSprite() -> int:
	return randi_range(0, 2)
