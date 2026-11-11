# Movimento em quatro direções: script do roteiro da Aula 08 (Prof. Ezefferth)
# Vida e dano: acrescentados pela folha de consulta da Aula 09
# Ataque: acrescentado pela folha de consulta da Aula 10
extends CharacterBody2D

@export var velocidade: float = 70.0
@export var vida: int = 3

var invencivel := false
var pode_atacar := true
var olhando := "baixo"
var atacando := false

# Hitbox do golpe (feito com ajuda de IA): fica na frente do lado em que ele olha, não em volta dele.
const FRENTE := {
	"baixo": [Vector2(0, 16), 0.0],
	"cima": [Vector2(0, -8), 0.0],
	"direita": [Vector2(11, 1), PI / 2],
	"esquerda": [Vector2(-11, 1), PI / 2],
}

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var hurtbox: Area2D = $Hurtbox
@onready var ataque: Area2D = $Ataque

func _process(_delta: float) -> void:
	# Tem inimigo encostando em mim?
	if not invencivel and hurtbox.has_overlapping_bodies():
		levar_dano()

	if pode_atacar and Input.is_action_just_pressed("atacar"):
		atacar()

func _physics_process(_delta: float) -> void:
	var direcao := Input.get_vector("left", "right", "up", "down")
	velocity = direcao * velocidade
	move_and_slide()

	# Sprite do herói (feito com ajuda de IA): durante o golpe a animação de ataque não é interrompida.
	if atacando:
		return

	# Parado: volta para o primeiro quadro do lado em que estava olhando.
	if direcao == Vector2.ZERO:
		anim.play(olhando)
		anim.stop()
		return

	# Guarda para onde ele olha, para o ataque sair virado para o mesmo lado.
	if abs(direcao.x) > abs(direcao.y):
		if direcao.x > 0:
			olhando = "direita"
		else:
			olhando = "esquerda"
	else:
		if direcao.y > 0:
			olhando = "baixo"
		else:
			olhando = "cima"
	ataque.position = FRENTE[olhando][0]
	ataque.rotation = FRENTE[olhando][1]
	anim.play(olhando)

func levar_dano() -> void:
	vida -= 1
	if vida <= 0:
		get_tree().current_scene.perder()
		return

	# Um segundo de invencibilidade, meio transparente.
	invencivel = true
	modulate.a = 0.4
	await get_tree().create_timer(1.0).timeout
	modulate.a = 1.0
	invencivel = false

func atacar() -> void:
	# Animação de ataque do herói (feito com ajuda de IA): o golpe acerta quando a espada chega na frente.
	pode_atacar = false
	atacando = true
	anim.play("ataque_" + olhando)
	await get_tree().create_timer(0.1).timeout
	for inimigo in ataque.get_overlapping_bodies():
		inimigo.levar_golpe()

	await anim.animation_finished
	atacando = false
	anim.play(olhando)
	anim.stop()
	# O próximo golpe só sai 0,15 s depois do fim deste.
	await get_tree().create_timer(0.15).timeout
	pode_atacar = true
