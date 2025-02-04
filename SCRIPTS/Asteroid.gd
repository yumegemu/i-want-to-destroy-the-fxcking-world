extends Enemy

func _physics_process(delta: float) -> void:
	velocidad = 10
	movimiento(delta)

func movimiento(delta: float) -> void:

	velocity = delta * Vector3(0, 0, 10.0) * velocidad
	move_and_slide()
