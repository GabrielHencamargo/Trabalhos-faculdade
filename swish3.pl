
resolve(Pos) :-
  Pos = navios(_,_,_,_,_),
  %chamine verde a esquerda do navio de kramer.
  navio(A,Pos),
  chamine(A,verde),
  navio(B,Pos),
  capitao(B,kramer),
  esquerda_de(A,B,Pos),
  %o navio que vai pra manila esta ao lado do navio do capitao white.
  navio(C,Pos),
  destino(C,manila),
  capitao(D,white),
  aolado(C,D,Pos),
  %chamine vermelha em algum lugar a esquerda do navio do capitao dexter.
  navio(E,Pos),
  chamine(F,vermelha),
  esquerda_de(F,E,Pos),
  capitao(E,dexter),
  %capitao ted na primeira posiçao.
  primeira_posicao(G,Pos),
  capitao(G,ted),
  %navio que vai pra rotterdam em uma das pontas
  uma_das_pontas(H,Pos),
  destino(H,rotterdam),
  %capitao newman ao lado do navio que vai pra macau
  aolado(I,J,Pos),
  capitao(I,newman),
  destino(J,macau),
  %navio do comandante white esta exatamente a esquerda da chamine verde
  exesquerda(K,L,Pos),
  capitao(K,white),
  chamine(L,verde),
  %navio que vai pra manila entre a chamine branca e o navio que carrega milho
  entre(M,N,M1,Pos),
  destino(N,manila),
  carga(M1,milho),
  chamine(M,branca),
  %navio que vai pra santos esta exatamente a esquerda do navio do comandadnte neewman
  exesquerda(O,P,Pos),
  destino(O,santos),
  capitao(P,newman),
  %carrega cacau e esta algum lugar a direita do navio da chamine verde
  algum_lugar_a_direita(Q,S,Pos),
  chamine(Q,verde),
  carga(S,cacau),
  %chamine verde ao lado do que carrega milho
  aolado(V,T,Pos),
  carga(T,milho),
  chamine(V,verde),
  %quem carrega arroz tem chamine verde
  navio(Y,Pos),
  carga(Y,arroz),
  chamine(Y,verde),
  %navio que carrega cafe esta algum lugar a esquerda do com chamine vermelha e este esta em algum lugar a esquerda do que vai partir as 8 h
  esquerda_de(X,Z,Pos),
  carga(X,cafe),
  chamine(Z,vermelha),
  esquerda_de(Z,A1,Pos),
  horario(A1,8),
  %navio que parte as 5h te algum lugar a direira do navio da chamine verde
  algum_lugar_a_direita(A2,A3,Pos),
  horario(A3,5),
  chamine(A2,verde),
  %chamine amarela esta em algum lugar a esquerda do navio qu parte as 8 h
  esquerda_de(A4,A5,Pos),
  chamine(A4,amarela),
  horario(A5,8),
  %chamine vermelha esta em algum lugar a esquerda do  navio que parte as 6h
  esquerda_de(A6,A7,Pos),
  chamine(A6,vermelha),
  horario(A7,6),
  %chamine vermelha em algum lugar entre o navio que parte as 9h e o navio do capitao dexter.
  entre(A8,A9,B1,Pos),
  chamine(A9,vermelha),
  horario(A8,9),
  capitao(B1,dexter),
  %navio espanhol esta ao lado do navio que carrega cacau.
  aolado(B2,B3,Pos),
  nacionalidade(B2,espanhol),
  carga(B3,cacau),
  %o navo com chamine amarela , em algum lugar a esquerda do navio frances
  esquerda_de(B4,B5,Pos),
  nacionalidade(B5,frances),
  chamine(B4,amarela),
  %o navio de chamine vermelha esta em algum lugar a esquerda do navio brasileiro.
  esquerda_de(B6,B7,Pos),
  chamine(B6,vermelha),
  nacionalidade(B7,brasileiro),
  %o navio que vai pra santos esta imediatamente a esquerda do navio italiano
  exesquerda(B8,B9,Pos),
  nacionalidade(B9,italiano),
  destino(B8,santos),
  %fechamento
  navio(Z6,Pos),
  chamine(Z6,azul),
  navio(Z7,Pos),
  nacionalidade(Z7,alemao),
  navio(Z8,Pos),
  horario(Z8,7),
  navio(Z10,Pos),
  destino(Z10,hamburgo),
  navio(Z9,Pos),
  carga(Z9,cha).
%definir

navio(X,navios(X,_,_,_,_)).
navio(X,navios(_,X,_,_,_)).
navio(X,navios(_,_,X,_,_)).
navio(X,navios(_,_,_,X,_)).
navio(X,navios(_,_,_,_,X)).

primeira_posicao(X,navios(X,_,_,_,_)).

chamine(navio(X,_,_,_,_,_),X).
nacionalidade(navio(_,X,_,_,_,_),X).
horario(navio(_,_,X,_,_,_),X).
carga(navio(_,_,_,X,_,_),X).
destino(navio(_,_,_,_,X,_),X).
capitao(navio(_,_,_,_,_,X),X).

aolado(X,Y,navios(X,Y,_,_,_)).
aolado(X,Y,navios(_,X,Y,_,_)).
aolado(X,Y,navios(_,_,X,Y,_)).
aolado(X,Y,navios(_,_,_,X,Y)).
aolado(X,Y,navios(Y,X,_,_,_)).
aolado(X,Y,navios(_,Y,X,_,_)).
aolado(X,Y,navios(_,_,Y,X,_)).
aolado(X,Y,navios(_,_,_,Y,X)).

algum_lugar_a_direita(X,Y,navios(X,Y,_,_,_)).
algum_lugar_a_direita(X,Y,navios(X,_,Y,_,_)).
algum_lugar_a_direita(X,Y,navios(X,_,_,Y,_)).
algum_lugar_a_direita(X,Y,navios(X,_,_,_,Y)).
algum_lugar_a_direita(X,Y,navios(_,X,Y,_,_)).
algum_lugar_a_direita(X,Y,navios(_,X,_,Y,_)).
algum_lugar_a_direita(X,Y,navios(_,_,X,Y,_)).
algum_lugar_a_direita(X,Y,navios(_,X,_,_,Y)).
algum_lugar_a_direita(X,Y,navios(_,_,X,_,Y)).
algum_lugar_a_direita(X,Y,navios(_,_,_,X,Y)).

esquerda_de(X,Y,Navios) :-
   algum_lugar_a_direita(X,Y,Navios).
   
uma_das_pontas(X,navios(X,_,_,_,_)).
uma_das_pontas(X,navios(_,_,_,_,X)).

exesquerda(X,Y,navios(X,Y,_,_,_)).
exesquerda(X,Y,navios(_,_,X,Y,_)).
exesquerda(X,Y,navios(_,_,_,X,Y)).
exesquerda(X,Y,navios(_,X,Y,_,_)).

entre(X,Z,Y,navios(_,X,Z,Y,_)).
entre(X,Z,Y,navios(X,_,Z,Y,_)).
entre(X,Z,Y,navios(_,_,X,Z,Y)).
entre(X,Z,Y,navios(_,X,_,Z,Y)).
entre(X,Z,Y,navios(_,X,Z,_,Y)).
entre(X,Z,Y,navios(X,_,Z,_,Y)).
entre(X,Z,Y,navios(X,_,_,Z,Y)).
entre(X,Z,Y,navios(X,Z,_,_,Y)).
entre(X,Z,Y,navios(X,Z,_,Y,_)).
entre(X,Z,Y,navios(X,Z,Y,_,_)).

