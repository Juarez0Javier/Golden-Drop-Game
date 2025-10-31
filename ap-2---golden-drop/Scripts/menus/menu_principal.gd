extends Control

@warning_ignore("UNUSED_SIGNAL")
signal iniciar_juego

func _on_jugar_button_down() -> void:
	emit_signal("iniciar_juego")

func _on_salir_button_down() -> void:
	get_tree().quit()
