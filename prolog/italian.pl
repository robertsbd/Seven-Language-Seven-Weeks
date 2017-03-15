word(astante,  a,s,t,a,n,t,e). 
word(astoria,  a,s,t,o,r,i,a). 
word(baratto,  b,a,r,a,t,t,o). 
word(cobalto,  c,o,b,a,l,t,o). 
word(pistola,  p,i,s,t,o,l,a). 
word(statale,  s,t,a,t,a,l,e).

solve(V1, V2, V3, H1, H2, H3) :-
    word(V1, V11, A, V13, B, V15, C, V17),
    word(V2, V21, D, V23, E, V25, F, V27),
    word(V3, V31, G, V33, H, V35, I, V37),    
    word(H1, H11, A, H13, D, H15, G, H17),
    word(H2, H21, B, H23, E, H25, H, H27),
    word(H3, H31, C, H33, F, H35, I, H37),
    V1 \= V2, V1 \= V3, V1 \= H1, V1 \= H2, V1 \= H3,
    V2 \= V3, V2 \= H1, V2 \= H2, V2 \= H3,
    V3 \= H1, V3 \= H2, V3 \= H3,
    H1 \= H2, H1 \= H3,
    H2 \= H3. 