# DEVLOG

## Aula 08 — 07/10

O que fiz: a arena do castelo, um retângulo de 24 × 14 peças que cabe numa tela, com muro em volta, quatro pilares e colisão, e o personagem andando nas quatro direções.
Como fiz: com ajuda de IA (Claude), seguindo a técnica do roteiro da Aula 08; conferi rodando o jogo e lendo cada parte.
O que travou: com a câmera em zoom 3 da vila, a arena não cabia inteira na tela.
Como resolvi: tirei a câmera e fiz a janela do tamanho da arena (384 × 224, escalada 3× em números inteiros).

## Aula 09 — 21/10 (feita em 03/11, atrasada)

O que fiz: o inimigo que persegue, a horda que nasce nas quatro bordas da arena e aperta com o tempo, a vida com um segundo de invencibilidade, as telas de vitória e derrota e o placar com vida e tempo. Por enquanto vence quem aguenta 60 s; a saída do tipo Fuga é a próxima etapa.
Como fiz: com ajuda de IA (Claude), seguindo a folha de consulta da Aula 09, um commit por parte e testando cada uma antes de seguir.
O que travou: as fontes da folha (48 no fim e 32 no placar) são para uma tela de 1152 px, e a minha arena tem 384 px; o texto não cabia.
Como resolvi: usei um terço do tamanho, 16 e 11, que fica na mesma proporção.

## Ficha do tipo Fuga — 04/11

O que fiz: a saída. Um portão escondido no canto da arena que só aparece quando o relógio zera; antes disso ele não percebe ninguém. Encostar nele depois de aberto vence a partida.
Como fiz: com ajuda de IA (Claude), seguindo a ficha Fuga da folha da Aula 09 (próxima etapa, fora da tag aula-09). O sprite é o portão do castelo do próprio Tiny Town. Testei ficando em cima do lugar da saída antes de ela abrir (nada acontece) e entrando nela depois (vitória).
O que travou: na primeira posição, no canto de cima, o portão ficava embaixo do placar.
Como resolvi: mudei a saída para o canto de baixo, à direita, longe do jogador e do placar.
