extends Node

@onready var pjcaja = get_node("../PJCaja")
@onready var objetivo = get_node("../Objetivo")

var vida = 100

func _ready():
	
	objetivo.body_entered.connect(_on_objetivo_body_entered)
	pass
	
func _process(_delta: float):
	if vida == 0:
		get_tree().quit()
	pass
	
func _on_objetivo_body_entered(body: Node2D):
	if body.name == "PJCaja":
		get_tree().quit()
	pass
	
