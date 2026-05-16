
% FACTS


% Parents

parent(peter, simon).
parent(margaret, simon).

parent(peter, Eunice).
parent(margaret, Eunice).

parent(peter, john).
parent(margaret, john).

parent(peter, rebecca).
parent(margaret, rebecca).

parent(peter, stephen).
parent(margaret, stephen).

parent(Eunice, kimberley).

parent(john, Trayson).
parent(sophie, Trayson).

parent(john, Tracey).
parent(sophie, Tracey).

parent(john, Tahila).
parent(sophie, Tahila).

parent(Rebecca, Liam).
parent(Kim, Liam).

parent(Rebecca, Liana).
parent(Kim, Liana).





% Gender
male(peter).
male(simon).
male(john).
male(stephen).
male(Kim).
male(Trayson).
male(Liam).

female(margaret).
female(Eunice).
female(rebecca).
female(kimberley).
female(sophie).
female(Tracey).
female(Tahila).
female(Liana).

% RULES


% Father
father(X, Y) :-
    parent(X, Y),
    male(X).

% Mother
mother(X, Y) :-
    parent(X, Y),
    female(X).

% Grandparent
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Grandfather
grandfather(X, Y) :-
    grandparent(X, Y),
    male(X).

% Grandmother
grandmother(X, Y) :-
    grandparent(X, Y),
    female(X).

% Child
child(X, Y) :-
    parent(Y, X).

% Grandchild
grandchild(X, Y) :-
    grandparent(Y, X).

% Siblings
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Cousins
cousin(X, Y) :-
    parent(A, X),
    parent(B, Y),
    sibling(A, B),
    X \= Y.

% Uncle
uncle(X, Y) :-
    sibling(X, Z),
    parent(Z, Y),
    male(X).

% Aunt
aunt(X, Y) :-
    sibling(X, Z),
    parent(Z, Y),
    female(X).