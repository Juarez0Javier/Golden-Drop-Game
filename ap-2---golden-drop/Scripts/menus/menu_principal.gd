extends Control


@warning_ignore("UNUSED_SIGNAL")
signal iniciar_cinematica


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_salir_pressed() -> void:
	get_tree().quit()


func _on_opciones_pressed() -> void:
	$BotonesPrincipal.hide()
	$MenuOpciones.show()


func _on_selec_nivel_pressed() -> void:
	get_parent().cambiar_escena("Menues/seleccion_de_nivel")
	self.call_deferred("queue_free")
	

func _on_jugar_pressed() -> void:
	emit_signal("iniciar_cinematica")


func _on_volver_pressed() -> void:
	$MenuOpciones.hide()
	$BotonesPrincipal.show()
