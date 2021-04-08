extends KinematicBody2D

const SPEED = 400
const GRAVITY = 50
const JUMP_POWER = -1000
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var on_ground = false

func _physics_process(_delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite.play("correr")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.play("correr")
		$AnimatedSprite.flip_h = true
	else:
		velocity.x = 0
		if on_ground == true:
			$AnimatedSprite.play("quieto")
		
	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocity.y = JUMP_POWER
			on_ground = false
	
	velocity.y += GRAVITY
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
		if velocity.y < 0:
			$AnimatedSprite.play("saltar")
		else:
			$AnimatedSprite.play("caer")
			
	velocity = move_and_slide(velocity, FLOOR)
		




func _on_vamos_pressed():
	get_tree().change_scene("res://Mundos/anuncio1.tscn")
	



func _on_nooo_pressed():
	get_tree().quit()


func _on_continuar_pressed():
	get_tree().change_scene("res://Mundos/nivel1.tscn")

