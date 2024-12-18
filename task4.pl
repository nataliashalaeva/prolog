а(ньюкасл,карлайл,58).
а(карлайл,пенрит,23).
а(городБ,городаА,15).
а(пенрит, дарлингтон,52).
а(городБ,городВ,10).
а(уэркингтон, карлайл, 33).
а(уэркингтон,городВ,5).
а(уэркингтон,пенрит,39).
а(дарлингтон,городА,25).

%Привет всем

обр([],[]).
обр([Н|Т],L):- обр(T,Z), присоединить(Z,[Н],L).


принадлежит(Х,[Х|_]).
принадлежит(Х,[_|Y]):- принадлежит(Х,Y).

присоединить([], X, X).
присоединить([А|В]),С,[А|D]:- присоединить(В,С,D).

найтивce(X,G,_):-asserta(найденo(мapкep)), call(G), asserta(найденo(X)),fail.
найтивсе(_,_,L):- собрать_найденное([],М),!, L=M.
собрать_найденное(S,L):- взятьеще(Х),!,собрать_найденное([Х |S],L).
собрать_найденное(L,L).
взятьеще(Х):- retract(найдено(Х)),!, Х\==маркер.

переход (Старт,Цель,Путь):-переход3([г(0,[Старт])],Цель,R), обр(R,Путь).

переходЗ (Пути,Цель,Путь):-кратчайший (Пути,Кратчайший,ОстПути), продлить(Кратчайший,Цель,ОстПути,Путь).
продлить(г(Расст,Путь),Цель,_,Путь):- Путь = [Цель|_].
продлить(г(Расст,[Послед| Бывали]),Цель,Пути,Путь):-найтивсе(г(D1,[Z,Послед|Бывали]),следузел(Послед,Бывали,Z,Расст,D1),Список), присоединить(Список,Пути,НовПути), переходЗ(НовПути,Цель,Пути).
кратчайший([Путь[Пути],Кратчайший,[Путь|Ост]):-кратчайший(Пути,Кратчайший,Ост), короче(Кратчайший,Путь),!.
кратчайший(Путь|Ост],Путь,Ост).
короче(г(М1,_),г(М2, _):- M1 ‹ М2.
следузел(Х,Бывали,Y,Расст,НовРасст):-(a(X,Y,Z); a(Y,X,Z)),not(принадлежит(Y,Бывали)),НовРасст is Расст+Z.