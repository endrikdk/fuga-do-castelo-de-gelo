# DEVLOG

## Aula 08 — 07/10

O que fiz: a arena do castelo, um retângulo de 24 × 14 peças que cabe numa tela, com muro em volta, quatro pilares e colisão, e o personagem andando nas quatro direções.
Como fiz: seguindo a técnica do roteiro da Aula 08; conferi rodando o jogo e lendo cada parte.
O que travou: com a câmera em zoom 3 da vila, a arena não cabia inteira na tela.
Como resolvi: tirei a câmera e fiz a janela do tamanho da arena (384 × 224, escalada 3× em números inteiros).

## Aula 09 — 21/10 (feita em 03/11, atrasada)

O que fiz: o inimigo que persegue, a horda que nasce nas quatro bordas da arena e aperta com o tempo, a vida com um segundo de invencibilidade, as telas de vitória e derrota e o placar com vida e tempo. Por enquanto vence quem aguenta 60 s; a saída do tipo Fuga é a próxima etapa.
Como fiz: seguindo a folha de consulta da Aula 09, um commit por parte e testando cada uma antes de seguir.
O que travou: as fontes da folha (48 no fim e 32 no placar) são para uma tela de 1152 px, e a minha arena tem 384 px; o texto não cabia.
Como resolvi: usei um terço do tamanho, 16 e 11, que fica na mesma proporção.

## Ficha do tipo Fuga — 04/11

O que fiz: a saída. Um portão escondido no canto da arena que só aparece quando o relógio zera; antes disso ele não percebe ninguém. Encostar nele depois de aberto vence a partida.
Como fiz: seguindo a ficha Fuga da folha da Aula 09 (próxima etapa, fora da tag aula-09). O sprite é o portão do castelo do próprio Tiny Town. Testei ficando em cima do lugar da saída antes de ela abrir (nada acontece) e entrando nela depois (vitória).
O que travou: na primeira posição, no canto de cima, o portão ficava embaixo do placar.
Como resolvi: mudei a saída para o canto de baixo, à direita, longe do jogador e do placar.

## Aula 10 — 28/10 (feita em 04/11, atrasada)

O que fiz: o inimigo agora calcula o caminho e dá a volta nos pilares, em vez de ficar empurrando a parede; e o jogador ganhou o ataque no Espaço, um clarão em volta dele que derruba quem estiver dentro, com recarga de 0,4 s e o placar de abates.
Como fiz: seguindo a folha de consulta da Aula 10, um commit por parte. O mapa do chão livre (Navegacao) tem o contorno por fora do muro e o Agent Radius padrão, 10. Testei pondo o inimigo atrás de cada pilar em seis posições: com o script da Aula 09 ele chegou 0 vezes de 6, com o agente chegou 6 de 6.
O que travou: o golpe chama o levar_golpe() do inimigo; se o código do jogador entrasse antes do código do inimigo, apertar Espaço perto de um inimigo dava erro.
Como resolvi: commitei primeiro a tecla e o círculo do golpe na cena e depois todo o código junto (jogador, inimigo e arena), para o jogo nunca ficar quebrado entre um commit e outro.
