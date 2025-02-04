extends CharacterBody3D

const velocidad = 5.0

# Aquí configuramos las capas de colisión
func _ready():
	# Configuramos el layer y mask
	collision_layer = 1  # Capa 1: El jugador pertenece a la capa 1
	collision_mask = 2   # Capa 2: El jugador interactúa con enemigos que están en la capa 2

func _physics_process(_delta: float) -> void:
	velocity = Vector3.ZERO
	
	# Obtener la dirección del input en X y Y
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Crear la dirección del movimiento solo en X y Y
	var direction := Vector3(input_dir.x, input_dir.y, 0).normalized()

	# Si hay movimiento, actualizamos la velocidad.
	if direction.length() > 0:
		velocity.x = direction.x * velocidad
		velocity.y = -direction.y * velocidad

	# Llamamos a move_and_slide para aplicar el movimiento
	move_and_slide()
