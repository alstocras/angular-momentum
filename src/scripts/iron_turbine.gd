extends RigidBody2D;

func _physics_process(delta: float) -> void:
	var lookRange = Global.lookRange;
	var terrain = Global.terrainMap;
	var buildings = Global.buildingMap;
	if Global.totalBosons >= 10:
		for x in range(-lookRange, lookRange):
			for y in range(-lookRange, lookRange):
				var activeCellId := buildings.get_cell_source_id(Vector2i(x, y))
				if activeCellId == 2:
					print("making electricity");
					$AnimatedSprite2D.play("generate");
					
