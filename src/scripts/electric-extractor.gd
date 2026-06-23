extends RigidBody2D;

var terrain = Global.terrainMap;
var tMap = Global.buildingMap;

var bosonSpins: Array = [0, 1, 2];
var fermionSpins: Array = [0.5, 1.5]

func _physics_process(delta: float) -> void:
	var oreBelowMe = terrain.local_to_map(global_position)
	if Global.energyProduced >= 2:
		if not $AnimatedSprite2D.is_playing():
			$AnimatedSprite2D.play("extract");
		if terrain.get_cell_source_id(oreBelowMe) == 2 and tMap.get_cell_source_id(oreBelowMe) == 0:
			var spin = bosonSpins.pick_random();
			Global.totalBosons += (1 * spin);
		elif terrain.get_cell_source_id(oreBelowMe) == 1 and tMap.get_cell_source_id(oreBelowMe) == 0:
			var spin = fermionSpins.pick_random();
			Global.totalFermions += (1 * spin);
		elif terrain.get_cell_source_id(oreBelowMe) == 3 and tMap.get_cell_source_id(oreBelowMe) == 0:
			Global.totalIron += 1;
		
		Global.energyProduced -= 2;
	
