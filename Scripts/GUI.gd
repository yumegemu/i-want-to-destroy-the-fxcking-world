extends Control

@onready var perdiste_label : Control = $Background/Perdiste
@onready var ganaste_label : Control = $Background/Ganaste
@onready var background : Control = $Background
@onready var timer_label : Control = $Timer/Label
@onready var time_remainer_label : Control = $Background/Perdiste/time_remainer
@onready var level : Node3D = $".."
var yaPerdio : bool = false

func start():
	self.visible = true
	background.visible = false
	perdiste_label.visible = false
	ganaste_label.visible = false

func perdiste(time_remainer : int):
	if !ganaste_label.visible and !yaPerdio :
		
		# permite q este codigo se ejecute una sola vez, 
		# sino mientras este en contacto se sigue ejecutando
		yaPerdio = true
		
		$AudioStreamPlayer2.play()
		await get_tree().create_timer(0.1).timeout
		timer_label.visible = false
		
		if time_remainer < 20 and time_remainer >= 10:
			time_remainer_label.text = "Tenias que esquivar solo un poco mas :("
		elif time_remainer < 10:
			time_remainer_label.text = "Ya estabas a nada :')"
		else:
			time_remainer_label.text = "Mmmm ni ganas le estabas poniendo..."
		background.visible = true
		perdiste_label.visible = true

func ganaste():
	# Espera 1 segundos para mostrar cartel de ganaste
	await get_tree().create_timer(1).timeout
	$AudioStreamPlayer.play()
	background.visible = true
	
	var sceneName = get_tree().current_scene.name
	
	if sceneName == "Level4" :
		$Background/Ganaste/Label2.text = "Lograste llegar a la tierra :D"
	ganaste_label.visible = true
	
	# Busca el nombre de la escena actual, le saca level y la extencion
	
	await get_tree().create_timer(2).timeout
		
	# Pregunta si es el level 4 para finalizar
	print(sceneName)
	if sceneName == "Level4" :
		get_tree().change_scene_to_file("res://Escenas/GUI/Final.tscn")
	else:
		# Le suma 1 al nro que quedo y cambia al proximo nivel
		get_tree().change_scene_to_file("res://Escenas/Levels/Level" + str(int(sceneName.replace("Level", "")) + 1) + ".tscn")
	
func tiempo(tiempoRestante : int):
	if tiempoRestante > 9:
		timer_label.text = "00:" + str(tiempoRestante)
	else:
		timer_label.text = "00:0" + str(tiempoRestante)
