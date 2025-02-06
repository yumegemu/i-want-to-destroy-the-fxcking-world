extends videoPlayer

func _process(delta: float) -> void:
	if Input.is_anything_pressed():
		video_stream_player.stop()
		get_tree().change_scene_to_file("res://Escenas/GUI/GanasteJuego.tscn")

func _on_finished() -> void:
	get_tree().change_scene_to_file("res://Escenas/GUI/GanasteJuego.tscn")

func _on_timer_timeout() -> void:
	fade_out()
