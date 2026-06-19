extends CharacterBody2D;
@export var speed: float = 400;
var direction: Vector2;

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("moveWest", "moveEast", "moveNorth", "moveSouth");
	
	if direction != Vector2.ZERO:
		velocity = direction * speed;
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed);
	
	move_and_slide();
