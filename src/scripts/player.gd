extends CharacterBody2D;
@export var speed: float = 400;
var direction: Vector2;

signal placeExtractor()

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("moveWest", "moveEast", "moveNorth", "moveSouth");
	
	if direction != Vector2.ZERO:
		velocity = direction * speed;
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed);
		if Input.is_action_just_pressed("placeObj"):
			placeExtractor.emit()
			
		
	move_and_slide();
