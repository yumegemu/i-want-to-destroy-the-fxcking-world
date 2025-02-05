extends Node3D

@onready var timer_spawn = $TimerSpawn

var enemy = preload("res://Escenas/Satellites/Satellite1.tscn")
var enemy2 = preload("res://Escenas/Satellites/Satellite2.tscn")
var enemy3 = preload("res://Escenas/Satellites/Satellite3.tscn")

func _on_timer_spawn_timeout() -> void:
	spaw_enemy()

func spaw_enemy():
	
	var spriteNumber = randomSprite()
	print(spriteNumber)
	var newEnemy = enemy.instantiate()

	if 2 == spriteNumber:
		newEnemy = enemy2.instantiate()
	elif 0 == spriteNumber:
		newEnemy = enemy3.instantiate()
	
	newEnemy.position = Vector3(random(),random(),-10)
	get_parent().call_deferred("add_child", newEnemy)

func random() -> int:
	return randi() % 3 - 1
	
func randomSprite() -> int:
	return randi() % 3
