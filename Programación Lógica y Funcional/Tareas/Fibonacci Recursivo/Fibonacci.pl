fibo(0,0). #caso base
fibo(1,1). #caso base
fibo(N,R):-N>1,
A is N-1,B is N-2,
fibo(A,T1),fibo(B,T2),
R is T1+T2.
