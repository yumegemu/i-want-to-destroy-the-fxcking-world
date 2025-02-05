extends Control

@onready var perdiste_label : Control = $Background/Perdiste
@onready var ganaste_label : Control = $Background/Ganaste
@onready var background : Control = $Background
@onready var timer_label : Control = $Timer/Label

func start():
	self.visible = true
	background.visible = false
	perdiste_label.visible = false
	ganaste_label.visible = false

func perdiste():
	background.visible = true
	perdiste_label.visible = true

func ganaste():
	background.visible = true
	ganaste_label.visible = true
	
	# Espera 3 segundos para cambiar de nivel
	await get_tree().create_timer(3.0).timeout
	
	# Busca el nombre de la escena actual, le saca level y la extencion
	var nroSiguienteNivel = get_tree().current_scene.name.replace("Level", "").replace(".tscn", "")
	
	if int(nroSiguienteNivel) + 1 > 3 :
		print("entro ganaste")
		get_tree().change_scene_to_file("res://Escenas/GanasteJuego.tscn")
	
	get_tree().change_scene_to_file("res://Escenas/GanasteJuego.tscn")
	# Le suma 1 al nro que quedo y cambia al proximo nivel
	get_tree().change_scene_to_file("res://Escenas/Level" + str(int(nroSiguienteNivel) + 1) + ".tscn")

func tiempo(tiempoRestante : int):
	timer_label.text = str(tiempoRestante)
