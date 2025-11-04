extends Control


var ganarperder = false


func _ready() -> void:
	hide()
	

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
	$MarginContainer/MenuPausa.hide()
	$MarginContainer/MenuOpciones.show()


func _on_menu_principal_pressed() -> void:
	self.get_parent().get_parent().get_parent().cambiar_escena("MenuPrincipal")
	continuar()
	self.get_parent().get_parent().call_deferred("queue_free")


func _on_volver_pressed() -> void:
	$MarginContainer/MenuPausa.show()
	$MarginContainer/MenuOpciones.hide()
