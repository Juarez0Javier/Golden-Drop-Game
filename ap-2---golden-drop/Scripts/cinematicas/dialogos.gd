extends CanvasLayer

@onready var texto := $texto
@onready var sonido := $"../AudioStreamPlayer"
@onready var boton = $"../Boton"

@warning_ignore("UNUSED_SIGNAL")
signal iniciar_juego

var dialogos = [
	"Has sido tocada por la sangre del cielo.",
	"Eres débil. Frágil.",
	"Pero dentro de ti hay algo precioso.",
	"Si deseas conservarlo, ven hacia mí."
]

var indice := 0
var cambiar_indice := false

func _ready():
	$"..".connect("finaliza_cinematica", _iniciar_dialogos)
	mostrar_dialogo_actual()
	sonido.play()
	
func _input(event):
	pass

func _iniciar_dialogos():
	cambiar_indice = true				

func mostrar_dialogo_actual():
	texto.text = dialogos[indice]
					
func siguiente_linea(): 
	if cambiar_indice:
			if indice < dialogos.size()-1:	
				indice += 1
				mostrar_dialogo_actual()
			if indice == dialogos.size()-1:
				cambiar_indice = false
						
	return cambiar_indice

func _on_boton_pressed() -> void:
	var continua = siguiente_linea()
	if !continua:
		boton.text = "Empezar"
