extends RigidBody2D;
var canGenerate: bool;

func _physics_process(delta: float) -> void:
	var lookRange = Global.lookRange;
	var terrain = Global.terrainMap;
	var buildings = Global.buildingMap;
	if Global.totalIron >= 10:
		var myPos = buildings.local_to_map(global_position);
		if buildings.get_cell_source_id(myPos) == 1:
			if not $AnimatedSprite2D.is_playing():
				$AnimatedSprite2D.play("generate");
				Global.totalIron -= 10
				Global.energyProduced += 1;
				canGenerate = false
				await get_tree().create_timer(5).timeout
				$AnimatedSprite2D.stop()
				Global.energyProduced = 0;
				canGenerate = true
					
