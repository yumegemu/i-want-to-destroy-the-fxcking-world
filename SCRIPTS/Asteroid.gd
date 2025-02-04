extends Enemy

func _ready() -> void:
	velocidad = 10
	collision_layer = 2 # Capa 2 para los enemigos
	collision_mask = 1 # Los enemigos interactúan solo con el jugador (capa 1)

func _physics_process(delta: float) -> void:
	movimiento(delta)

func movimiento(delta: float) -> void:
	velocity = Vector3(0, 0, 10) * velocidad * delta
	move_and_slide()
