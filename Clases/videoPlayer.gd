extends VideoStreamPlayer
class_name videoPlayer

@onready var video_stream_player: VideoStreamPlayer = $"."
@onready var rich_text_label: RichTextLabel = $RichTextLabel

var fade_duration = 0.8
var fade_tween: Tween

func _ready() -> void:
	fade_in()
	await get_tree().create_timer(fade_duration).timeout
	await get_tree().create_timer(0.3).timeout


func fade_in():
	if fade_tween: fade_tween.kill()
	fade_tween = get_tree().create_tween()
	fade_tween.tween_property(rich_text_label, "modulate", Color.WHITE, fade_duration)

func fade_out():
	if fade_tween: fade_tween.kill()
	fade_tween = get_tree().create_tween()
	fade_tween.tween_property(rich_text_label, "modulate", Color.TRANSPARENT, fade_duration)
