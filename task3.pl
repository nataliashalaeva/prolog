ханой(N):- переместить(N, левый,средний,правый).
переместить(0,_,_,_):-!.
переместить(N, А,В,С):-М is N-1,переместить(М,А,С,В),сообщить(А,В), переместить(М,С,В,А).
сообщить(Х,Y):-write([переместили,диск,со,штыря,Х,на, штырь,Y]),nl.