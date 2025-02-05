class_name Enemy
extends CharacterBody3D

@export() var velocidad : float

func _physics_process(delta: float) -> void:
	velocity = Vector3(0,0,10) * velocidad * delta
	if move_and_slide():
		self.queue_free()
