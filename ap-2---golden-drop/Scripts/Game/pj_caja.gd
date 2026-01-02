extends CharacterBody2D

var velocidad = 12.0
var velocidaMax = 170
var impulsoSalto = 600

var gravedad = 15
@onready var sprite = get_node("AnimatedSprite2D")
@onready var gameState = get_node("../GameState")

@export var inputHabilitado = true

func _physics_process(delta: float) -> void:
	var movimiento = Vector2.ZERO
	
	##Movimiento en el Piso
	if is_on_floor() and inputHabilitado:
		if Input.is_action_pressed("Mover Derecha") and inputHabilitado:
			movimiento.x += velocidad
			sprite.flip_h = false
			sprite.play("Caminar")
			$SonidosCaminar.stream_paused = false
		elif Input.is_action_pressed("Mover Izquierda"):
			movimiento.x -= velocidad
			sprite.flip_h = true
			sprite.play("Caminar")
			$SonidosCaminar.stream_paused = false
		else:
			velocity.x = 0
			sprite.play("Idle")
			$SonidosCaminar.stream_paused = true
		if Input.is_action_just_pressed("Saltar"):
			sprite.play("Salto")
			$SonidoSaltar.play()
			movimiento.y = impulsoSalto * (-1)
		
	
	##Movimiento en el Aire		
	if !is_on_floor() and inputHabilitado :
		if Input.is_action_pressed("Mover Derecha") and inputHabilitado:
				movimiento.x += int(velocidad/5)
		elif Input.is_action_pressed("Mover Izquierda") and inputHabilitado:
				movimiento.x -= int(velocidad/5)
		else:
			velocity.x = 0
			sprite.play("En Aire")
			
		$SonidosCaminar.stream_paused = true
		
	##SonidoMovimiento
		
	#Gravdad
	movimiento.y += gravedad
	
	#Movement Calculation
	velocity.y += movimiento.y * delta * 50
	velocity.x += movimiento.x * delta * 50
	
	velocity.x = clamp(velocity.x, -velocidaMax, velocidaMax)
	velocity.y = clamp(velocity.y, velocity.y, gravedad * 50)
	
	move_and_slide()

func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "Salto":
		sprite.play("En Aire")
		pass
		
func morir():
	if sprite.animation != "Muerte":
		inputHabilitado = false
		sprite.play("Muerte")
