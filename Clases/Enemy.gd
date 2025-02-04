class_name Enemy
extends CharacterBody3D

@export() var velocidad : float

func movimiento(_delta: float) -> void:
	pass

# Señal para cuando el personaje toca al enemigo
#signal tocado_por_personaje

# Función que se ejecuta cuando algo entra en el área de colisión
#func _on_body_entered(body: Node3D) -> void:
#	if body.name == "Personaje1":  # Asegúrate de que el cuerpo que entra sea el personaje
#		emit_signal("tocado_por_personaje")  # Emitir la señal de colisión
