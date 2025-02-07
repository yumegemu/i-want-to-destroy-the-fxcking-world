extends Node3D

@onready var gui : Control = $GUI
@onready var timer = $Timer
@onready var camera = $Camera3D

@onready var rich_text_label = $CanvasLayer/RichTextLabel

var perdio : bool = false
var levelName= ""

func _ready():
	gui.start()
	rich_text_label.modulate = Color.TRANSPARENT
	levelName = get_tree().current_scene.name

func perdiste():
	if !perdio:
		perdio = true
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
	if perdio:
		if Input.is_anything_pressed():
			await get_tree().create_timer(0.5).timeout
			if get_tree() != null:
				get_tree().change_scene_to_file("res://Escenas/Levels/"+ levelName + ".tscn")


func stop_spawners():
	var sceneName = get_tree().current_scene.name

	if "Level1" == sceneName:
		$SpawnAsteriod/TimerSpawn.stop()
		$SpawnAsteriod2/TimerSpawn.stop()
		$SpawnAsteriod3/TimerSpawn.stop()
		$SpawnAsteriod4/TimerSpawn.stop()
		$SpawnAsteriod5/TimerSpawn.stop()
		$SpawnAsteriod6/TimerSpawn.stop()
	elif "Level2" == sceneName:
		$SpawnAsteriod/TimerSpawn.stop()
		$SpawnAsteriod2/TimerSpawn.stop()
		$SpawnAsteriod3/TimerSpawn.stop()
		$SpawnAsteriod4/TimerSpawn.stop()
		$SpawnAsteriod5/TimerSpawn.stop()
		$SpawnAsteriod6/TimerSpawn.stop()
		$SpawnAsteriod7/TimerSpawn.stop()
		$SpawnAsteriod8/TimerSpawn.stop()
		$SpawnUfo/TimerSpawn.stop()
		$SpawnUfo2/TimerSpawn.stop()
	elif "Level3" == sceneName:
		$SpawnSatellites/TimerSpawn.stop()
		$SpawnSatellites2/TimerSpawn.stop()
		$SpawnSatellites3/TimerSpawn.stop()
		$SpawnSatellites4/TimerSpawn.stop()
		$SpawnSatellites5/TimerSpawn.stop()
		$SpawnSatellites6/TimerSpawn.stop()
		$SpawnSatellites7/TimerSpawn.stop()
		$SpawnSatellites8/TimerSpawn.stop()
		$SpawnUfo/TimerSpawn.stop()
		$SpawnUfo2/TimerSpawn.stop()
	elif "Level4" == sceneName:
		$SpawnRocket/TimerSpawn.stop()
		$SpawnRocket2/TimerSpawn.stop()
		$SpawnRocket3/TimerSpawn.stop()
		$SpawnRocket4/TimerSpawn.stop()
		$SpawnRocket5/TimerSpawn.stop()
		$SpawnRocket6/TimerSpawn.stop()
		$SpawnRocket7/TimerSpawn.stop()
		$SpawnRocket8/TimerSpawn.stop()
		$SpawnRocket9/TimerSpawn.stop()
		$SpawnRocket10/TimerSpawn.stop()
		$SpawnRocket11/TimerSpawn.stop()
		$SpawnRocket12/TimerSpawn.stop()
		$SpawnRocket13/TimerSpawn.stop()
		$SpawnRocket14/TimerSpawn.stop()
		
