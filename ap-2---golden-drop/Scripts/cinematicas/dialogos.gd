extends CanvasLayer

@warning_ignore("UNUSED_SIGNAL")
signal dialogos_terminados

@onready var texto := $texto
@onready var sonido := $"../AudioStreamPlayer"

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
	
func _input(event):
	if cambiar_indice:
		if event.is_action_pressed("ui_accept"):
			sonido.play()
			if indice < dialogos.size()-1:
				indice += 1
				mostrar_dialogo_actual()
			else:
				emit_signal("dialogos_terminados")

func _iniciar_dialogos():
	cambiar_indice = true
	
func mostrar_dialogo_actual():
	texto.text = dialogos[indice]
