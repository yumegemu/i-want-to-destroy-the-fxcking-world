extends Control

@onready var perdiste_label : Control = $Background/Perdiste
@onready var ganaste_label : Control = $Background/Ganaste

func start():
	self.visible = false
	perdiste_label.visible = false
	ganaste_label.visible = false
	
func perdiste():
	self.visible = true
	perdiste_label.visible = true

func ganaste():
	self.visible = true
	ganaste_label.visible = true
