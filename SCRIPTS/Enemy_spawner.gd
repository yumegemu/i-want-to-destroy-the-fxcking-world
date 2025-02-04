extends Node3D

@onready var spawntime = $SpawnerTimer

const ENEMY = preload("res://Escenas/Asteorid.tscn")

func _on_spawner_timer_timeout() -> void:
	var newEnemy = ENEMY.instantiate()
	get_parent().add_child(newEnemy)
	
	newEnemy.global_position = Vector3(random(),random(),-5)

func random() -> int:
	return randi() % 3 - 1
