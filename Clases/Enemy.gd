class_name Enemy
extends CharacterBody3D

@export() var velocidad : float

var stopa = false

func _physics_process(delta: float) -> void:
	velocity = Vector3(0,0,10) * velocidad * delta
	
	if !stopa:
		if move_and_slide():
			var className = get_last_slide_collision().get_collider().get_class()
			if "CharacterBody3D"  == className:
				pass
			else:
				get_parent().get_node("Movimiento").play()
				self.queue_free()

func stop():
	stopa = true
	
