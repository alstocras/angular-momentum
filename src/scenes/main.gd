extends Node2D;

var basicExtractor = preload("res://src/scenes/extractor.tscn");
var mousePos;
@onready var playerScene = $Player

func _ready():
	playerScene.placeExtractor.connect(playerScene.placeExtractor());
