extends Enemy

@onready var level : Node3D = $".."

func _ready() -> void:
	velocidad = 45
