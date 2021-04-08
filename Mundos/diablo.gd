extends KinematicBody2D

var speed = 350
var direction = 1

func _ready():
	
	set_physics_process(true)

func _physics_process(_delta):
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.play("diablo")
		
	if (is_on_wall()):
		direction *= -1
	
	if(test_move(Transform2D(0, Vector2(position.x+20000*direction, position.y)),Vector2(0,32))):
		direction *= -1
	
	move_and_slide(Vector2(speed * direction, 0), Vector2(0, -1))
