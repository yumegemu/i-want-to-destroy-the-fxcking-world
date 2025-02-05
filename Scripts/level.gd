extends Node3D

@onready var gui : Control = $GUI
@onready var timer = $Timer
@onready var spawmAsteroids = $SpawnAsteriod/TimerSpawn
@onready var spawmUfo = $SpawnUfo/TimerSpawn
@onready var spawmStellites = $SpawnSatellites/TimerSpawn
@onready var spawmRocket = $SpawnRocket/TimerSpawn

func _ready():
	gui.start()

func perdiste():
	timer.set_paused(true)
	var timer_remainer = timer.time_left
	gui.perdiste(timer_remainer)

func _on_timer_timeout() -> void:
	var sceneName = get_tree().current_scene.name
	
	if "Level1" == sceneName:
		spawmAsteroids.stop()
	elif "Level2" == sceneName:
		spawmAsteroids.stop()
		spawmUfo.stop()
	elif "Level3" == sceneName:
		spawmStellites.stop()
	elif "Level4" == sceneName:
		spawmRocket.stop()
	
	await get_tree().create_timer(4).timeout
	gui.ganaste()

func _physics_process(_delta: float) -> void:
	gui.tiempo(timer.time_left + 1)
