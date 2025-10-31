extends CanvasLayer

@warning_ignore("UNUSED_SIGNAL")
signal finaliza_cinematica
@warning_ignore("UNUSED_SIGNAL")
signal finaliza_intro

@onready var anim := $AnimatedSprite2D
@onready var boton_omitir := $Omitir
@onready var musica := $AudioStreamPlayer

var dialogos_mostrados := false
var dialogos_terminados := false
var dialogos_escena : CanvasLayer



func _ready():
	anim.play("cinematic")
	musica.play()

	anim.frame_changed.connect(_on_frame_changed)
	$Dialogos.connect("dialogos_terminados", _on_dialogos_terminados)

func _on_frame_changed():
	# En el frame 44 se muestran los diálogos
	if anim.frame == 44 and not dialogos_mostrados:
		emit_signal("finaliza_cinematica")
		_cargar_dialogos()

	# Cuando llega al frame 53, pasa a la animación de loop
	if anim.frame >= 53 and dialogos_mostrados and not dialogos_terminados:
		anim.play("loop_dialogos")

func _cargar_dialogos():
	dialogos_mostrados = true
	var dialogos_canvas = $Dialogos.get_children()
	for child in dialogos_canvas:
		child.visible = true

func _on_omitir_pressed() -> void:
	ir_a_juego()
		
func _on_dialogos_terminados():
	dialogos_terminados = true
	ir_a_juego()

func ir_a_juego():
	emit_signal("finaliza_intro")
