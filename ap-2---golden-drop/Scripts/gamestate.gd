extends Node

@onready var pjcaja = get_node("../PJCaja")

var humedad = 0
var maxHumedad = 100
var muerto = false

var enRefugio = false

var cartones = 0
var gotaD = false
var chekpointUlt = null
var collUlti = []

var meta = Vector2(0,0)
var inicio = Vector2(0,0)

func _ready():
	
	pass
	
func _process(_delta: float):
	
	humedad = clamp(humedad,0,maxHumedad)
	
	if humedad == maxHumedad:
		pjcaja.morir()
		$FadeOut/AnimationPlayer.play("Flush")
		
	if $FadeOut/AnimationPlayer.current_animation == "Flush" and snapped($FadeOut/AnimationPlayer.current_animation_position,0.1) == $FadeOut/AnimationPlayer.current_animation_length / 2:
		reset()
	pass
	

func ganar():
	$"../MenuGanar".mostrarMenu(humedad,cartones,gotaD,get_parent().name)

func reset():
	
	pjcaja.position = chekpointUlt.position
	pjcaja.inputHabilitado = true 
	
	for coll in collUlti:
		if coll.name.find("Carton") != -1:
			cartones -= 1
		if coll.name.find("Gota") != -1:
			gotaD = false
		coll.enablePickup()
		
	collUlti.clear()
	
	humedad = 0
	muerto = false
	pass
