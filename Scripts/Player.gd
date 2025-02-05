extends CharacterBody3D

const velocidad = 5.0

@onready var level : Node3D = $".."

func _physics_process(_delta: float) -> void:
	colision()
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


func colision() -> void:
	var from_position = global_transform.origin
	var to_position= from_position + global_transform.basis.z * -2.0
	var ray_querry = PhysicsRayQueryParameters3D.create(to_position, from_position)
	ray_querry.exclude = [self]
	ray_querry.collision_mask = 2
	
	
	var space_state = get_world_3d().direct_space_state
	var result = space_state.intersect_ray(ray_querry)
	print(result.values())
	if len(result) > 0:
		level.perdiste()
	
	
	
	
	
	
	
	
	
	
