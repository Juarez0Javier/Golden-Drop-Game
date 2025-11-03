extends Control


var selectnivel : PackedScene
@warning_ignore("UNUSED_SIGNAL")
signal iniciar_cinematica


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selectnivel = load("res://Escenas/Menues/seleccion_de_nivel.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_salir_pressed() -> void:
	get_tree().quit()


func _on_opciones_pressed() -> void:
	pass # Replace with function body.


func _on_selec_nivel_pressed() -> void:
	var menu_nivel = selectnivel.instantiate()
	self.get_parent().add_child(menu_nivel)
	self.call_deferred("queue_free")
	

func _on_jugar_pressed() -> void:
	emit_signal("iniciar_cinematica")
