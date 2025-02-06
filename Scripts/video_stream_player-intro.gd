extends VideoStreamPlayer

@onready var video_stream_player: VideoStreamPlayer = $"."
@onready var rich_text_label: RichTextLabel = $RichTextLabel


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_anything_pressed():
		video_stream_player.stop()
