extends videoPlayer

func _on_finished() -> void:
	get_tree().change_scene_to_file("res://Escenas/GUI/intro.tscn")
