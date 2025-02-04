extends Node3D

@onready var gui : Control = $GUI

func _ready():
	gui.start()
	
func perdiste():
	gui.perdiste()
	
func ganaste():
	gui.ganaste()
