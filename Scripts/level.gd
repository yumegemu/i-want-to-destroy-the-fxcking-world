extends Node3D

@onready var gui : Control = $GUI
@onready var timer = $Timer

func _ready():
	gui.start()

func perdiste():
	gui.perdiste()

func _on_timer_timeout() -> void:
	gui.ganaste()

func _physics_process(_delta: float) -> void:
	gui.tiempo(timer.time_left + 1)
