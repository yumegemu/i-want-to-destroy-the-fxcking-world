extends VideoStreamPlayer

@onready var video_stream_player: VideoStreamPlayer = $"."
@onready var rich_text_label: RichTextLabel = $RichTextLabel

var fade_duration = 1.0
var fade_tween: Tween
var ready_to_fade_out: bool = false

func _ready() -> void:
	fade_in()
	await get_tree().create_timer(fade_duration).timeout


func _process(delta: float) -> void:
	if ready_to_fade_out:
		fade_out()
		await get_tree().create_timer(fade_duration).timeout

	if Input.is_anything_pressed():
		video_stream_player.stop()
		get_tree().change_scene_to_file("res://Escenas/GUI/Menu.tscn")
	
	
func fade_in():
	if fade_tween: fade_tween.kill()
	fade_tween = get_tree().create_tween()
	fade_tween.tween_property(rich_text_label, "modulate", Color.WHITE, fade_duration)
	fade_tween.finished.connect(func(): ready_to_fade_out = true)

func fade_out():
	if fade_tween: fade_tween.kill()
	fade_tween = get_tree().create_tween()
	fade_tween.tween_property(rich_text_label, "modulate", Color.TRANSPARENT, fade_duration)
	fade_tween.finished.connect(func(): ready_to_fade_out = false)
