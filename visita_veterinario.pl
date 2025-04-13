% Atributos possíveis
camiseta(amarela).
camiseta(azul).
camiseta(branca).
camiseta(verde).
camiseta(vermelha).

dono(bruno).
dono(caio).
dono(raphael).
dono(sidney).
dono(victor).

profissao(analista).
profissao(designer).
profissao(joalheiro).
profissao(policial).
profissao(sociologo).

companhia(amigo).
companhia(irma).
companhia(filho).
companhia(esposa).
companhia(mae).

animal(cachorro).
animal(furao).
animal(gato).
animal(iguana).
animal(mini_porco).

idade(1).
idade(2).
idade(3).
idade(4).
idade(5).

% Regras auxiliares
aoLado(X, Y, Lista) :- nextto(X, Y, Lista); nextto(Y, X, Lista).
aEsquerda(X, Y, Lista) :- nth0(IX, Lista, X), nth0(IY, Lista, Y), IX < IY.
aDireita(X, Y, Lista) :- aEsquerda(Y, X, Lista).
noCanto(X, Lista) :- last(Lista, X).
noCanto(X, [X|_]).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H, T)), todosDiferentes(T).

% Solução principal
solucao(ListaSolucao) :-
    ListaSolucao = [
        pessoa(Camiseta1, Dono1, Prof1, Comp1, Animal1, Idade1),
        pessoa(Camiseta2, Dono2, Prof2, Comp2, Animal2, Idade2),
        pessoa(Camiseta3, Dono3, Prof3, Comp3, Animal3, Idade3),
        pessoa(Camiseta4, Dono4, Prof4, Comp4, Animal4, Idade4),
        pessoa(Camiseta5, Dono5, Prof5, Comp5, Animal5, Idade5)
    ],

    % Regras dadas no enunciado
    % O animal de 2 anos está na primeira posição
    ListaSolucao = [pessoa(_, _, _, _, _, 2)|_],

    % O dono que está com a irmã está ao lado do dono da camiseta vermelha
    aoLado(pessoa(_, _, _, irma, _, _), pessoa(vermelha, _, _, _, _, _), ListaSolucao),

    % O policial está à direita do rapaz de azul
    aDireita(pessoa(_, _, policial, _, _, _), pessoa(azul, _, _, _, _, _), ListaSolucao),

    % Quem está com um amigo está ao lado de quem está com a irmã
    aoLado(pessoa(_, _, _, amigo, _, _), pessoa(_, _, _, irma, _, _), ListaSolucao),

    % Victor está ao lado do rapaz que está com a mãe
    aoLado(pessoa(_, victor, _, _, _, _), pessoa(_, _, _, mae, _, _), ListaSolucao),

    % Sidney está em uma das pontas
    noCanto(pessoa(_, sidney, _, _, _, _), ListaSolucao),

    % O mini porco está exatamente à direita do animal mais velho
    aDireita(pessoa(_, _, _, _, mini_porco, _), pessoa(_, _, _, _, _, 5), ListaSolucao),

    % O dono da camiseta azul é joalheiro
    member(pessoa(azul, _, joalheiro, _, _, _), ListaSolucao),

    % O sociólogo está ao lado de quem tem o animal mais novo
    aoLado(pessoa(_, _, sociologo, _, _, _), pessoa(_, _, _, _, _, 1), ListaSolucao),

    % Raphael está na quinta posição
    ListaSolucao = [_, _, _, _, pessoa(_, raphael, _, _, _, _)],

    % O cachorro tem 4 anos
    member(pessoa(_, _, _, _, cachorro, 4), ListaSolucao),

    % Em uma das pontas está o homem com o filho
    noCanto(pessoa(_, _, _, filho, _, _), ListaSolucao),

    % O sociólogo está ao lado de quem está com o filho
    aoLado(pessoa(_, _, sociologo, _, _, _), pessoa(_, _, _, filho, _, _), ListaSolucao),

    % Caio tem um gato
    member(pessoa(_, caio, _, _, gato, _), ListaSolucao),

    % O rapaz de azul está à esquerda do dono do animal de 5 anos
    aEsquerda(pessoa(azul, _, _, _, _, _), pessoa(_, _, _, _, _, 5), ListaSolucao),

    % O rapaz da camiseta amarela está ao lado de quem está com a mãe
    aoLado(pessoa(amarela, _, _, _, _, _), pessoa(_, _, _, mae, _, _), ListaSolucao),

    % O animal de 4 anos está na terceira posição
    ListaSolucao = [_, _, pessoa(_, _, _, _, _, 4), _, _],

    % A iguana tem 3 anos
    member(pessoa(_, _, _, _, iguana, 3), ListaSolucao),

    % O homem de branco está exatamente à esquerda de Victor
    nextto(pessoa(branca, _, _, _, _, _), pessoa(_, victor, _, _, _, _), ListaSolucao),

    % Na terceira posição está o dono que está com a irmã
    ListaSolucao = [_, _, pessoa(_, _, _, irma, _, _), _, _],

    % O designer tem uma iguana
    member(pessoa(_, _, designer, _, iguana, _), ListaSolucao),

    % O joalheiro e o sociólogo estão lado a lado
    aoLado(pessoa(_, _, joalheiro, _, _, _), pessoa(_, _, sociologo, _, _, _), ListaSolucao),

    % O rapaz que está com a mãe é dono do animal de 5 anos
    member(pessoa(_, _, _, mae, _, 5), ListaSolucao),

    % Domínios
    camiseta(Camiseta1), camiseta(Camiseta2), camiseta(Camiseta3), camiseta(Camiseta4), camiseta(Camiseta5),
    todosDiferentes([Camiseta1, Camiseta2, Camiseta3, Camiseta4, Camiseta5]),

    dono(Dono1), dono(Dono2), dono(Dono3), dono(Dono4), dono(Dono5),
    todosDiferentes([Dono1, Dono2, Dono3, Dono4, Dono5]),

    profissao(Prof1), profissao(Prof2), profissao(Prof3), profissao(Prof4), profissao(Prof5),
    todosDiferentes([Prof1, Prof2, Prof3, Prof4, Prof5]),

    companhia(Comp1), companhia(Comp2), companhia(Comp3), companhia(Comp4), companhia(Comp5),
    todosDiferentes([Comp1, Comp2, Comp3, Comp4, Comp5]),

    animal(Animal1), animal(Animal2), animal(Animal3), animal(Animal4), animal(Animal5),
    todosDiferentes([Animal1, Animal2, Animal3, Animal4, Animal5]),

    idade(Idade1), idade(Idade2), idade(Idade3), idade(Idade4), idade(Idade5),
    todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]).
