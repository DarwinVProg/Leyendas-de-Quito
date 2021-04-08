extends Area2D

export var speed: float = 400
var direction := Vector2(1, 0)

func _process(delta):
	$spr.scale = Vector2(-direction.x, 1)
	global_position.x += direction.x*speed*delta



func _on_fuego_body_exited():
	queue_free()
