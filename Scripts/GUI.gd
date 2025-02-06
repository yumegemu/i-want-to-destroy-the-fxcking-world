extends Control

@onready var perdiste_label : Control = $Background/Perdiste
@onready var ganaste_label : Control = $Background/Ganaste
@onready var background : Control = $Background
@onready var timer_label : Control = $Timer/Label
@onready var time_remainer_label : Control = $Background/Perdiste/time_remainer
@onready var level : Node3D = $".."

func start():
	self.visible = true
	background.visible = false
	perdiste_label.visible = false
	ganaste_label.visible = false

func perdiste(time_remainer : int):
	if !ganaste_label.visible :
		timer_label.visible = false
		if time_remainer < 15:
			time_remainer_label.text = "Tenias que esquivar solo un poco mas :("
		elif time_remainer < 5:
			time_remainer_label.text = "Ya estabas a nada :'D"
		else:
			time_remainer_label.text = "Mmmm ni ganas le estabas poniendo..."
		background.visible = true
		perdiste_label.visible = true

func ganaste():
	# Espera 7 segundos para cambiar de nivel
	await get_tree().create_timer(3).timeout
	
	background.visible = true
	ganaste_label.visible = true
	
	await get_tree().create_timer(2).timeout
	
	# Busca el nombre de la escena actual, le saca level y la extencion
	var nroSiguienteNivel = get_tree().current_scene.name.replace("Level", "")
	
	await get_tree().create_timer(0.2).timeout
	if int(nroSiguienteNivel) > 3 :
		get_tree().change_scene_to_file("res://Escenas/GUI/final.tscn")
		return
		
	# Le suma 1 al nro que quedo y cambia al proximo nivel
	get_tree().change_scene_to_file("res://Escenas/Levels/Level" + str(int(nroSiguienteNivel) + 1) + ".tscn")

func tiempo(tiempoRestante : int):
	if tiempoRestante > 9:
		timer_label.text = "00:" + str(tiempoRestante)
	else:
		timer_label.text = "00:0" + str(tiempoRestante)

func _on_restart_pressed() -> void:
	level.delete_enemies()
	await get_tree().create_timer(0.2).timeout
	get_tree().reload_current_scene()
