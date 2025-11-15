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
	cambiar_escena(Escenas.MenuPrincipal)
	

func cambiar_escena(nombre_escena: String):
	var ruta = "res://Escenas/" + nombre_escena + ".tscn"
	
	if escena_actual != null:
		escena_actual.queue_free()
	
	var siguiente_escena = instancia_escena(ruta)
	add_child(siguiente_escena)
	escena_actual = siguiente_escena

	gestionar_musica()

func instancia_escena(ruta):
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
