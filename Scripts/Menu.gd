extends Control

func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://Escenas/Levels/Level1.tscn")

func _on_opciones_pressed():
	get_tree().change_scene_to_file("res://Escenas/GUI/Opciones.tscn")

func _on_salir_pressed():
	get_tree().quit()

func _on_volver_pressed():
	get_tree().change_scene_to_file("res://Escenas/GUI/Menu.tscn")
	
func _on_atras_pressed():
	get_tree().change_scene_to_file("res://Escenas/GUI/Menu.tscn")
