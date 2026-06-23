extends RigidBody2D
var generating: bool = false
var costTimer: float = 5.0

func _physics_process(delta: float) -> void:
	var buildings = Global.buildingMap
	if not generating:
		if Global.totalIron >= 10:
			var myPos = buildings.local_to_map(global_position)
			if buildings.get_cell_source_id(myPos) == 1:
				Global.totalIron -= 10
				generating = true
				costTimer = 5.0
				$AnimatedSprite2D.play("generate")
	else:
		Global.energyAvailable += 0.5 * delta
		costTimer -= delta
		if costTimer <= 0:
			generating = false
			$AnimatedSprite2D.stop()
