extends Node3D

@onready var gui : Control = $GUI
@onready var timer = $Timer
@onready var spawmAsteroids = $SpawnAsteriod/TimerSpawn
@onready var spawmAsteroids2 = $SpawnAsteriod2/TimerSpawn
@onready var spawmAsteroids3 = $SpawnAsteriod3/TimerSpawn
@onready var spawmUfo = $SpawnUfo/TimerSpawn
@onready var spawmStellites = $SpawnSatellites/TimerSpawn
@onready var spawmStellites2 = $SpawnSatellites/TimerSpawn
@onready var spawmStellites3 = $SpawnSatellites3/TimerSpawn
@onready var spawmRocket = $SpawnRocket/TimerSpawn
@onready var spawmRocket2 = $SpawnRocket2/TimerSpawn
@onready var spawmRocket3 = $SpawnRocket3/TimerSpawn
@onready var spawmRocket4 = $SpawnRocket4/TimerSpawn
@onready var spawmRocket5 = $SpawnRocket5/TimerSpawn
@onready var spawmRocket6 = $SpawnRocket6/TimerSpawn
@onready var spawmRocket7 = $SpawnRocket7/TimerSpawn
@onready var camera = $Camera3D

@onready var rich_text_label = $CanvasLayer/RichTextLabel

func _ready():
	gui.start()
	rich_text_label.modulate = Color.TRANSPARENT

func perdiste():
	camera.camera_shake()
	detener_enemigos()
	timer.set_paused(true)
	var timer_remainer = timer.time_left
	gui.perdiste(timer_remainer)

func detener_enemigos():
	stop_spawners()
	
	var hijos = get_children()
	
	for hijo in hijos:
		if hijo is CharacterBody3D:
			hijo.stop()

func _on_timer_timeout() -> void:
	
	stop_spawners()
	
	await get_tree().create_timer(4).timeout
	gui.ganaste()

func delete_enemies():
	var hijos = get_children()
	
	for hijo in hijos:
		if hijo is CharacterBody3D:
			hijo.queue_free()

func _physics_process(_delta: float) -> void:
	gui.tiempo(timer.time_left + 1)


func stop_spawners():
	var sceneName = get_tree().current_scene.name

	if "Level1" == sceneName:
		spawmAsteroids.stop()
		spawmAsteroids2.stop()
	elif "Level2" == sceneName:
		spawmAsteroids.stop()
		spawmAsteroids2.stop()
		spawmAsteroids3.stop()
		spawmUfo.stop()
	elif "Level3" == sceneName:
		spawmStellites.stop()
		spawmStellites2.stop()
		spawmStellites3.stop()
		spawmUfo.stop()
	elif "Level4" == sceneName:
		spawmRocket.stop()
		spawmRocket2.stop()
		spawmRocket3.stop()
		spawmRocket4.stop()
		spawmRocket5.stop()
		spawmRocket6.stop()
		spawmRocket7.stop()
		
