extends CharacterBody2D;
@export var speed: float = 400;
var direction: Vector2;
var objPath = preload("res://src/scenes/player.tscn");
var mainScene = preload("res://src/scenes/main.tscn")
var mousePos;
var obj;

func _physics_process(delta: float) -> void:
	mousePos = get_global_mouse_position();
	direction = Input.get_vector("moveWest", "moveEast", "moveNorth", "moveSouth");
	
	if direction != Vector2.ZERO:
		velocity = direction * speed;
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed);
		
	if Input.is_action_just_pressed("placeObj"):
		obj = objPath.instantiate();
		obj.global_position = mousePos;
		add_child(obj)
	
	move_and_slide();
