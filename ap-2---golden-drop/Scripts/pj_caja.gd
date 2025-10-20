extends CharacterBody2D

var velocidad = 12
var velocidaMax = 170
var impulsoSalto = 600

var gravedad = 15

func _physics_process(delta: float) -> void:
	var movimiento = Vector2.ZERO
		
	#To stop X acceleration
	
	
	##Movimiento en el Piso
	if is_on_floor():
		if Input.is_action_pressed("Mover Derecha"):
			movimiento.x += velocidad
		elif Input.is_action_pressed("Mover Izquierda"):
			movimiento.x -= velocidad
		else:
			velocity.x = 0
		if Input.is_action_just_pressed("Saltar"):
			movimiento.y = impulsoSalto * (-1)
	
	##Movimiento en el Aire		
	if !is_on_floor():
		if Input.is_action_pressed("Mover Derecha"):
				movimiento.x += int(velocidad/5)
		elif Input.is_action_pressed("Mover Izquierda"):
				movimiento.x -= int(velocidad/5)
		 
	#Gravdad
	movimiento.y += gravedad
	
	#Movement Calculation
	velocity.y += movimiento.y * delta * 50
	velocity.x += movimiento.x * delta * 50
	
	velocity.x = clamp(velocity.x, -velocidaMax, velocidaMax)
	velocity.y = clamp(velocity.y, velocity.y, gravedad * 50)
	
	##print(movimiento)
	
	move_and_slide()
	
	
	
