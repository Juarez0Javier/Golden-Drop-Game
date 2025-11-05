extends Node

const Escenas = {
	MenuPrincipal = "MenuPrincipal",
	Cinematica = "Cinematica",
	Juego = "Niveles/nv_1_taller"
}

var escena_actual : Node

func _ready() -> void:
	cambiar_escena(Escenas.MenuPrincipal)

func cambiar_escena(nombre_escena: String):
	var ruta = "res://Escenas/" + nombre_escena + ".tscn"
	
	if escena_actual != null:
		escena_actual.queue_free()
	
	var siguiente_escena = load(ruta).instantiate()
	add_child(siguiente_escena)
	escena_actual = siguiente_escena
	
	if(nombre_escena != "MenuPrincipal" and nombre_escena != "Menues/seleccion_de_nivel"):
		$MusicaMenu.stop()
	elif $MusicaMenu.playing == false:
		$MusicaMenu.play()
	
	conectar_seniales(nombre_escena)

func conectar_seniales(nombre_escena: String):
	match nombre_escena:
		Escenas.MenuPrincipal:
				escena_actual.connect("iniciar_cinematica", Callable(self, "cambiar_escena").bind(Escenas.Cinematica))
				
		Escenas.Cinematica:
				escena_actual.connect("iniciar_juego", Callable(self, "cambiar_escena").bind(Escenas.Juego))


func _on_musica_menu_finished() -> void:
	$MusicaMenu.play()
