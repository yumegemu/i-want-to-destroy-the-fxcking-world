extends Node3D

@onready var timer_spawn = $TimerSpawn

var enemy = preload("res://Escenas/Ufo/ufo.tscn")

func _on_timer_spawn_timeout() -> void:
	spaw_enemy()

func spaw_enemy():
	var newEnemy = enemy.instantiate()
	newEnemy.position = Vector3(random(),random(),-10)
	get_parent().call_deferred("add_child", newEnemy)

func random() -> int:
	return randi() % 3 - 1
