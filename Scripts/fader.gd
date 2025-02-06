extends CanvasLayer

@onready var rich_text_label = $RichTextLabel

var fade_duration = 1.0
var fade_tween: Tween
var ready_to_fade_out: bool = false

func _ready():
	rich_text_label.modulate = Color.TRANSPARENT
	fade_in()
	await get_tree().create_timer(fade_duration).timeout

func _physics_process(_delta: float) -> void:
	if ready_to_fade_out and Input.is_anything_pressed():
		fade_out()
		await get_tree().create_timer(fade_duration).timeout

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
