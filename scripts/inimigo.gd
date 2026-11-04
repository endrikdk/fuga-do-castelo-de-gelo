# Inimigo que contorna obstáculos: script da folha de consulta da Aula 10 (Prof. Ezefferth)
extends CharacterBody2D

@export var velocidade: float = 40.0

@onready var agente: NavigationAgent2D = $NavigationAgent2D

func _physics_process(_delta: float) -> void:
	var jogador := get_tree().get_first_node_in_group("player") as Node2D
	if jogador == null:
		return

	# O agente calcula o caminho; o inimigo só anda até o próximo ponto dele.
	agente.target_position = jogador.global_position
	var proximo := agente.get_next_path_position()
	velocity = global_position.direction_to(proximo) * velocidade
	move_and_slide()
