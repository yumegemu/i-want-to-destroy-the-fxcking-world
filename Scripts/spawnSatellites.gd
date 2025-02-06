extends Spawner


var enemy2 = preload("res://Escenas/Satellites/Satellite2.tscn")
var enemy3 = preload("res://Escenas/Satellites/Satellite3.tscn")

var newEnemy

func _ready():
	enemy = preload("res://Escenas/Satellites/Satellite1.tscn")

func spaw_enemy():
	
	instantiate()

	newEnemy.position = Vector3(random(),random(),-10)
	get_parent().call_deferred("add_child", newEnemy)

func instantiate():
	var spriteNumber = randomSprite()

	newEnemy = enemy.instantiate()

	if 2 == spriteNumber:
		newEnemy = enemy2.instantiate()
	elif 0 == spriteNumber:
		newEnemy = enemy3.instantiate()
