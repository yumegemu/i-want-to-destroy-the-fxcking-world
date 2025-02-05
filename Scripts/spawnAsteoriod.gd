extends Node3D

@onready var timer_spawn = $TimerSpawn

var enemy = preload("res://Escenas/Asteroide.tscn")
var nivelName = ""

func _start():
	var nivelName = get_tree().current_scene.name

func _on_timer_spawn_timeout() -> void:
	if nivelName == "Level2":
		timer_spawn.start(4)
		spaw_enemy()
	else:
		spaw_enemy()

func spaw_enemy():
	var newEnemy = enemy.instantiate()
	newEnemy.position = Vector3(random(),random(),-10)
	get_parent().call_deferred("add_child", newEnemy)

func random() -> int:
	return randi() % 3 - 1
