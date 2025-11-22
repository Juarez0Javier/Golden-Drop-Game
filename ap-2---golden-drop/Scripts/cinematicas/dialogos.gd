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
var empezar_nivel := false

func _ready():
	$"..".connect("finaliza_cinematica", _iniciar_dialogos)
	mostrar_dialogo_actual()
	sonido.play()


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
			siguiente_linea()
			if indice == dialogos.size(): 
					Main.cambiar_escena(Main.Escenas.Nivel1)
			
			
func _on_boton_pressed() -> void:
	siguiente_linea()

	
func _iniciar_dialogos():
	cambiar_indice = true				


func mostrar_dialogo_actual():
	texto.text = dialogos[indice]
	
					
func siguiente_linea(): 
	if cambiar_indice:
		indice += 1
		
		if indice <= dialogos.size()-1:	
			mostrar_dialogo_actual()
		else:
			cambiar_indice = false
			
		if indice == dialogos.size()-1:
			cambiar_texto_boton()

func cambiar_texto_boton():
	boton.text = "Empezar"
	empezar_nivel = true
		
