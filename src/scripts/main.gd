extends Node2D;

var mousePos;
var activeCell;
@onready var tMap = $Buildings;
@onready var terrain = $Terrain;
@onready var bosonLabel = $CanvasLayer/Bosons;
var bosonCount: int;

func _process(delta: float) -> void:
	mousePos = tMap.get_local_mouse_position();
	activeCell = tMap.local_to_map(mousePos);
	if Input.is_action_just_pressed("placeObj"):
		if not tMap.get_cell_source_id(activeCell) == 1:
			tMap.set_cell(activeCell, 0, Vector2i(0, 0), 1)
	if terrain.get_cell_source_id(activeCell) == 2 and tMap.get_cell_source_id(activeCell) == 0:
			print("extracting...");
			bosonCount += 1
	if Input.is_action_just_pressed("removeObj"):
		tMap.erase_cell(activeCell)
	bosonLabel.text = "bosons: " + str(bosonCount)
