extends Node3D

@onready var timer_spawn = $TimerSpawn

const enemy = preload("res://Escenas/ufo.tscn")

func _on_timer_spawn_timeout() -> void:
	var newEnemy = enemy.instantiate()
	
	get_parent().add_child(newEnemy)
	
	newEnemy.global_position = Vector3(random(),random(),-5)

func random() -> int:
	return randi() % 3 - 1
