extends Node

func _ready() -> void:
	states_map = {
		"movimiento": $movimiento,
		"atacando": $atacando
	}
	
.set_active(true)
change_state("movimiento")
owner.connect("attack", self , "change_state")

func change_state(new_state):
	.change_state(new_state)
