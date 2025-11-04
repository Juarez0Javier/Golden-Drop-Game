extends Control


var mainmenu : PackedScene
var ganarperder = false


func _ready() -> void:
	hide()
	mainmenu = load("res://Escenas/Main.tscn")

func _process(_delta: float) -> void:
	abrirMenu()

func continuar():
	get_tree().paused = false
	for child in get_parent().get_children():
		if(child is ColorRect):
			child.hide()
	hide()


func pausar():
	get_tree().paused = true
	for child in get_parent().get_children():
		if(child is ColorRect):
			child.show()
	show()


func abrirMenu():
	if Input.is_action_just_pressed("Pausar") and get_tree().paused == false and ganarperder == false:
		pausar()
		
	elif Input.is_action_just_pressed("Pausar") and get_tree().paused == true and ganarperder == false:
		continuar()


func _on_continuar_pressed() -> void:
	continuar()


func _on_opciones_pressed() -> void:
	pass # Replace with function body.


func _on_menu_principal_pressed() -> void:
	var main = mainmenu.instantiate()
	self.get_parent().get_parent().get_parent().add_child(main)
	continuar()
	self.get_parent().get_parent().call_deferred("queue_free")
