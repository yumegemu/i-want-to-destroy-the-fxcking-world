class_name Spawner
extends Node3D

@onready var timer_spawn = $TimerSpawn

@export() var enemy = preload("res://Escenas/Asteroids/Asteroide1.tscn")

var cantidad = 0

func _ready():
	pass

func _on_timer_spawn_timeout() -> void:
	spaw_enemy()
	spaw_enemy_chico()

func spaw_enemy():
	var newEnemy = enemy.instantiate()
	newEnemy.position = Vector3(random(),random(),-10)
	get_parent().call_deferred("add_child", newEnemy)
	
func spaw_enemy_chico():
	var newEnemy = enemy.instantiate()
	newEnemy.position = Vector3(random_chico(),random_chico(),-15)
	get_parent().call_deferred("add_child", newEnemy)

func random() -> int:
	cantidad = cantidad + 1
	print(cantidad)
	return randi_range(-2, 2)
	
func random_chico() -> int:
	cantidad = cantidad + 1
	print(cantidad)
	return randi_range(-1, 1)
	
func randomSprite() -> int:
	return randi_range(0, 2)
