extends Node

@onready var pjcaja = get_node("../PJCaja")

var humedad = 0
var humedadSet = 0

var enRefugio = false

var cartones = 0
var gotaD = false
var chekpointUlt = null
var collUlti = []

var nivel

func _ready():
	nivel = get_parent().name
	
func _process(_delta: float):
	
	humedad = clamp(humedad,0,100)
	
	if humedad == 100:
		$"../PJCaja/Ganar_Perder".mostrarMenu(humedad,cartones,gotaD,nivel)
	pass
	

func ganar():
	$"../PJCaja/Ganar_Perder".mostrarMenu(humedad,cartones,gotaD,nivel)

func reset():
	
	pjcaja.position = chekpointUlt.position 
	
	for coll in collUlti:
		if coll.name.find("Carton") != -1:
			print("Found ya!")
			cartones -= 1
		if coll.name.find("Gota") != -1:
			gotaD = false
		coll.enablePickup()
		
	collUlti.clear()
	
	humedad = 0
	pass
	
