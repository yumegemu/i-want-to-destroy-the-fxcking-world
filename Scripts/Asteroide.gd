extends Enemy

func _ready() -> void:
	velocidad = 10

func _physics_process(delta: float) -> void:
	movimiento(delta)

func movimiento(delta: float) -> void:
	velocity = Vector3(0,0,10) * velocidad * delta
	move_and_slide()
