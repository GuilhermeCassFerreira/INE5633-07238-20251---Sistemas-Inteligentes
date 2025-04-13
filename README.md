# 🧠 Visita ao Veterinário – Solução em Prolog

Este repositório contém a solução para o problema lógico **"Visita ao Veterinário"**, implementada em **Prolog**, como parte do **Trabalho I** da disciplina **Sistemas Inteligentes** (INE5633), ministrada pelo professor **Maicon Rafael Zatelli**, na **Universidade Federal de Santa Catarina (UFSC)**.

---

## 🧩 Descrição do Problema

Cinco pessoas diferentes visitaram o veterinário, cada uma com um animal de estimação diferente. Elas têm profissões distintas, vestem camisetas de cores diferentes, possuem companhias diferentes e têm idades distintas. O objetivo é determinar a associação correta entre todos esses atributos com base em um conjunto de dicas lógicas.

Este é um clássico problema de lógica do tipo "Zebra Puzzle", onde o raciocínio dedutivo é usado para cruzar pistas e chegar a uma única solução válida.

---

## 🔧 Linguagem e Sintaxe Utilizada

O programa é escrito em **Prolog**, uma linguagem lógica baseada em fatos, regras e inferência. Os principais conceitos utilizados são:

- **Fatos e Predicados**: representações declarativas da realidade (por exemplo, `membro(X, Lista)`).
- **Listas**: estrutura fundamental para representar os 5 indivíduos.
- **Regras (Cláusulas)**: derivam novas informações a partir de fatos (por exemplo, `à_esquerda_de(X, Y, Lista)`).
- **Unificação e Backtracking**: permite testar diferentes possibilidades automaticamente.
- **Comentários**: explicam a implementação de cada dica (começam com `%`).

Cada pessoa foi modelada com a estrutura:


pessoa(Cor, Nome, Profissao, Companhia, Animal, Idade)

A solução está representada por uma lista com cinco dessas estruturas.

▶️ Passo a Passo para Executar
🖥️ Pré-requisitos
Instale o SWI-Prolog.

📂 Passos
Abra o terminal e vá até o diretório onde está o arquivo:

```prolog
cd ~/Downloads/INE5633-07238-20251---Sistemas-Inteligentes
```
Inicie o interpretador Prolog:

```prolog
swipl
```

Carregue o arquivo com a solução:

```prolog
?- [visita_veterinario].
```

Execute o predicado principal para obter a solução:

```prolog
?- solucao(S).
```
A saída será algo como:

```bash
S = [pessoa(verde, sidney, analista, esposa, furao, 2),
     pessoa(branca, bruno, designer, amigo, iguana, 3),
     pessoa(azul, victor, joalheiro, irma, cachorro, 4),
     pessoa(vermelha, caio, sociologo, mae, gato, 5),
     pessoa(amarela, raphael, policial, filho, mini_porco, 1)]
```






