# Inimigo que contorna obstáculos e morre com o golpe: script da folha de consulta da Aula 10 (Prof. Ezefferth)
extends CharacterBody2D

@export var velocidade: float = 40.0
@export var vida: int = 1

@onready var agente: NavigationAgent2D = $NavigationAgent2D
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	var jogador := get_tree().get_first_node_in_group("player") as Node2D
	if jogador == null:
		return

	# O agente calcula o caminho; o inimigo só anda até o próximo ponto dele.
	agente.target_position = jogador.global_position
	var proximo := agente.get_next_path_position()
	velocity = global_position.direction_to(proximo) * velocidade
	move_and_slide()

	# Arte do tema: perto do jogador a gárgula ruge, longe ela anda.
	if global_position.distance_to(jogador.global_position) < 16:
		anim.play("atacar")
	else:
		anim.play("andar")

func levar_golpe() -> void:
	vida -= 1
	if vida <= 0:
		get_tree().current_scene.inimigo_morreu(self)
		queue_free()
