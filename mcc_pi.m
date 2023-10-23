function [Notranja, Zunanja] = mcc_pi(n)
% n - število naključnih točk, ki jih želimo generirati.
%Funkcija vrne notranje koordinate točk in zunanje koordniate na kvadratu[-1,1]x[-1,1].
matrika_vseh=-1+2*rand(n,2);%generiramo koordinate točk na kvadtratu [-1,1]x[-1,1].
Notranja=[];% ustvarimo dva arraya v katere vpisujemo tocke, ki so znortaj kroga
Zunanja=[];%in tocke, ki niso znotraj kroga
for i = 1:length(matrika_vseh)
    vektor=matrika_vseh(i,:);
    abs_vrednost=dot(vektor, vektor);%gledamo absolutno vrednost če je dolžina manjša od 1 je v krogu drugače izven
    if abs_vrednost < 1
    Notranja=[Notranja;vektor];%dodamo v array notranjih točk
    else
        Zunanja=[Zunanja;vektor];%dodamo v array zunanjih točk
    end
end  