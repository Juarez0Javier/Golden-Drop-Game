extends Node

const Escenas = {
	MenuPrincipal = "MenuPrincipal",
	Cinematica = "Cinematica",
	SeleccionNivel = "Menues/seleccion_de_nivel",
	Nivel1 = "Niveles/nv_1_taller"
}

var escena_actual : Node
var musica = ""

func _ready() -> void:
	escena_actual = obtener_instancia("MenuPrincipal")
	gestionar_musica()
	

func cambiar_escena(nombre_escena: String):
	if escena_actual != null:
		escena_actual.call_deferred("queue_free")
		escena_actual = null
	
	get_tree().paused = false
	
	var siguiente_escena = obtener_instancia(nombre_escena)
	add_child(siguiente_escena)
	escena_actual = siguiente_escena

	gestionar_musica()


func obtener_instancia(nombre_escena):
	var ruta = "res://Escenas/" + nombre_escena + ".tscn"
	var instancia = load(ruta).instantiate()
	return instancia
	
	
func gestionar_musica():
	if(escena_actual.name == "Menu Principal" or escena_actual.name == "Seleccion de Nivel"):
		musica = "res://Assets/sound/menus/menu.wav"
	else:
		musica = ""
	
	if MusicManager.musica_actual() != musica:
		MusicManager.detener_musica()
	
	if musica == "" or MusicManager.musica_actual() == musica:
		return 
	else:
		MusicManager.reproducir_musica(musica)
