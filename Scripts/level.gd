extends Node3D

@onready var gui : Control = $GUI
@onready var timer = $Timer
@onready var spawmAsteroids = $SpawnAsteriod/TimerSpawn
@onready var spawmUfo = $SpawnUfo/TimerSpawn
@onready var spawmStellites = $SpawnSatellites/TimerSpawn
@onready var spawmRocket = $SpawnRocket/TimerSpawn

@onready var rich_text_label = $CanvasLayer/RichTextLabel

var fade_duration = 1.0
var fade_tween: Tween
var ready_to_fade_out: bool = false

func _ready():
	gui.start()
	rich_text_label.modulate = Color.TRANSPARENT
	fade_in()
	await get_tree().create_timer(fade_duration).timeout

func perdiste():
	timer.set_paused(true)
	var timer_remainer = timer.time_left
	gui.perdiste(timer_remainer)

func _on_timer_timeout() -> void:
	ready_to_fade_out = true
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
	if ready_to_fade_out:
		fade_out()
		await get_tree().create_timer(fade_duration).timeout

func fade_in():
	if fade_tween: fade_tween.kill()
	fade_tween = get_tree().create_tween()
	fade_tween.tween_property(rich_text_label, "modulate", Color.WHITE, fade_duration)
	fade_tween.finished.connect(func(): ready_to_fade_out = true)

func fade_out():
	if fade_tween: fade_tween.kill()
	fade_tween = get_tree().create_tween()
	fade_tween.tween_property(rich_text_label, "modulate", Color.TRANSPARENT, fade_duration)
	fade_tween.finished.connect(func(): ready_to_fade_out = false)
