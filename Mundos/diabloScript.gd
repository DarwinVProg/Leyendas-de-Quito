extends KinematicBody2D

signal attack

onready var pos_fire = $spr/pos_fire
var player: KinematicBody2D = null

var velocity = Vector2();
var distance = Vector2();
var speed = 120;
var direction = Vector2(-1,0);

func _physics_process(delta):
	if $Rayiz.is_colliding() and !KinematicBody2D:
		KinematicBody2D = $Rayiz.get_collider()
		direction.x = -1
		$spr.scale = Vector2(-direction.x, 1)
		emit_signal("attack", "Atacando")
	elif $Rayde.is_colliding() and !KinematicBody2D:
		KinematicBody2D = $Rayde.get_collider()
		direction.x = 1
		$spr.scale = Vector2(-direction.x, 1)
		emit_signal("attack", "Atacando")
	if !$Rayiz.is_colliding() && !$Rayde.is_colliding():
		KinematicBody2D = null
		
func _on_Tiempo_timeout():
	direction.x = 1 if direction.x == -1 else -1
	$spr.scale = Vector2(-direction.x, 1)
	$Tiempo.start()
