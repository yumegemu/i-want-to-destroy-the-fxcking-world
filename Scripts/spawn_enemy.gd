extends Node3D

@onready var timer_spawn = $TimerSpawn

var enemy = preload("res://Escenas/Asteroide.tscn")

func _ready():
	var nroSiguienteNivel = get_tree().current_scene.name
	
	if "Level1" == nroSiguienteNivel :
		enemy = preload("res://Escenas/Asteroide.tscn")
		
	if "Level2" == nroSiguienteNivel :
		enemy = preload("res://Escenas/ufo.tscn")
	
	if "Level3" == nroSiguienteNivel :
		enemy = preload("res://Escenas/Rocket.tscn")


func _on_timer_spawn_timeout() -> void:
	var newEnemy = enemy.instantiate()
	
	get_parent().add_child(newEnemy)
	
	newEnemy.global_position = Vector3(random(),random(),-5)

func random() -> int:
	return randi() % 3 - 1
