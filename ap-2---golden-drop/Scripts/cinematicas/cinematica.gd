extends CanvasLayer

@warning_ignore("UNUSED_SIGNAL")
signal finaliza_cinematica
@warning_ignore("UNUSED_SIGNAL")
signal iniciar_juego

@onready var anim := $AnimatedSprite2D
@onready var boton := $Boton
@onready var musica := $AudioStreamPlayer

var dialogos_mostrados := false
var dialogos_escena : CanvasLayer

func _ready():
	anim.play("cinematic")
	musica.play()

	anim.frame_changed.connect(_on_frame_changed)
	
	boton.visible = false

func _on_frame_changed():
	# En el frame 44 se muestran los diálogos
	if anim.frame == 44 and not dialogos_mostrados:
		emit_signal("finaliza_cinematica")
		_cargar_dialogos()

	# Cuando llega al frame 53, pasa a la animación de loop
	if anim.frame >= 53 and dialogos_mostrados:
		anim.play("loop_dialogos")
		mostrar_boton_omitir()


func _cargar_dialogos():
	dialogos_mostrados = true
	var dialogos_canvas = $Dialogos.get_children()
	for child in dialogos_canvas:
		child.visible = true
	
func mostrar_boton_omitir():
	$AnimationPlayer.play("FadeIn-Boton")

func _on_boton_pressed() -> void:
	if boton.text!= "Siguiente": 
		emit_signal("iniciar_juego")
		
