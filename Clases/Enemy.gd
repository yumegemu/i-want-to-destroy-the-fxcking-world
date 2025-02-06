class_name Enemy
extends CharacterBody3D

@export() var velocidad : float

func _physics_process(delta: float) -> void:
	velocity = Vector3(0,0,10) * velocidad * delta
	if move_and_slide():
		var className = get_last_slide_collision().get_collider().get_class()
		if "CharacterBody3D"  == className:
			pass
		else:
			self.queue_free()
