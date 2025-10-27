extends Node

@onready var pjcaja = get_node("../PJCaja")
@onready var objetivo = get_node("../Objetivo")

var humedad = 0
var humedadSet = 0
var cartones = 0
var gotaD = false


func _ready():
	objetivo.body_entered.connect(_on_objetivo_body_entered)
	pass
	
func _process(_delta: float):
	
	humedad = clamp(humedad,0,100)
	
	if humedad == 100:
		get_tree().quit()
	pass
	
func _on_objetivo_body_entered(body: Node2D):
	if body.name == "PJCaja":
		get_tree().quit()
	pass
	
