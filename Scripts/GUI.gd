extends Control

@onready var perdiste_label : Control = $Background/Perdiste
@onready var ganaste_label : Control = $Background/Ganaste
@onready var background : Control = $Background
@onready var timer_label : Control = $Timer/Label
@onready var time_remainer_label : Control = $Background/Perdiste/time_remainer

func start():
	self.visible = true
	background.visible = false
	perdiste_label.visible = false
	ganaste_label.visible = false

func perdiste(time_remainer : int):
	timer_label.visible = false
	time_remainer_label.text = "Tenias que aguantar solo " + str(time_remainer) + " segundos mas :("
	background.visible = true
	perdiste_label.visible = true

func ganaste():
	background.visible = true
	ganaste_label.visible = true
	
	# Espera 3 segundos para cambiar de nivel
	await get_tree().create_timer(3.0).timeout
	
	# Busca el nombre de la escena actual, le saca level y la extencion
	var nroSiguienteNivel = get_tree().current_scene.name.replace("Level", "")
	
	if int(nroSiguienteNivel) + 1 > 3 :
		get_tree().change_scene_to_file("res://Escenas/GUI/GanasteJuego.tscn")
		return null
		
	# Le suma 1 al nro que quedo y cambia al proximo nivel
	get_tree().change_scene_to_file("res://Escenas/Levels/Level" + str(int(nroSiguienteNivel) + 1) + ".tscn")

func tiempo(tiempoRestante : int):
	if tiempoRestante > 9:
		timer_label.text = "00:" + str(tiempoRestante)
	else:
		timer_label.text = "00:0" + str(tiempoRestante)

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
