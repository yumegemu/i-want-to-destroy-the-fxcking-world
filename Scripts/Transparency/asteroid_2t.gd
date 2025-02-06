extends Node3D

@export_range(0,1) var opacity : float = 0.3

func _process(delta: float) -> void:
	var mesh : MeshInstance3D = get_node("Cube_001")
	var mat0 : Material = mesh.get_active_material(0)
	var mat1 : Material = mat0.next_pass
	
	mat1.albeto_color = Color(1,1,1,opacity)
	mat1.transparency = BaseMaterial3D.TRANSPARENCY_DISABLED if opacity >= 1 else BaseMaterial3D.TRANSPARENCY_ALPHA
