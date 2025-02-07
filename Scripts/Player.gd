extends CharacterBody3D

const velocidad = 5.0

@onready var level : Node3D = $".."


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
	
	if !$"..".perdio:
		# Llamamos a move_and_slide para aplicar el movimiento
		if move_and_slide():
			var className = get_last_slide_collision().get_collider().get_class()
			if "RigidBody3D"  == className:
				pass
			else:
				level.perdiste()

func stop():
	pass
