extends Node2D;

var basicExtractor = preload("res://src/scenes/extractor.tscn");
var mousePos;
var obj;
@onready var playerScene = $Player

func _process(delta: float) -> void:
	mousePos = get_global_mouse_position();
	if Input.is_action_just_pressed("placeObj"):
		obj = basicExtractor.instantiate()
		obj.global_position = mousePos
		add_child(obj)
