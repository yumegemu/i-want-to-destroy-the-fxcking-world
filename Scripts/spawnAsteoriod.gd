extends Spawner

var enemy2 = preload("res://Escenas/Asteroids/Asteroide2.tscn")
var enemy3 = preload("res://Escenas/Asteroids/Asteroide3.tscn")
var nivelName = ""

func _ready():
	enemy = preload("res://Escenas/Asteroids/Asteroide1.tscn")
	var nivelName = get_tree().current_scene.name

func _on_timer_spawn_timeout() -> void:
	if nivelName == "Level2":
		timer_spawn.start(4)
		spaw_enemy()
	else:
		spaw_enemy()

func spaw_enemy():
	
	var spriteNumber = randomSprite()
	var newEnemy = enemy.instantiate()

	if 2 == spriteNumber:
		newEnemy = enemy2.instantiate()
	elif 0 == spriteNumber:
		newEnemy = enemy3.instantiate()
	
	newEnemy.position = Vector3(random(),random(),-10)
	get_parent().call_deferred("add_child", newEnemy)
