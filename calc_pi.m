priblizki_pi = [];%ustvarimo array da notri dajemo približke in napake
napake=[];
for b = 1:12 %povecamo število točk ki jih funkcija računa od 1 do 12
    n=2^b;
    [Notranja,Zunanja]=mcc_pi(n);
    [zadnji_prib,zadnja_nap] = area_pi(Notranja,Zunanja);
    priblizki_pi=[priblizki_pi;zadnji_prib];%matrika kjer gledamo kakšne približke ustvari glede na koliko je n
    napake = [napake;zadnja_nap];
end

x=linspace(-1,1,1000);
yy=@(x)[sqrt(1-x.^2);-sqrt(1-x.^2)];%enačba krožnice
mat_y = yy(x);%v matriko doda + in - vrednosti y koordniat krožnice
y1=mat_y(1,:);%+ koordniata
y2=mat_y(2,:);%-koordinata
plot(Notranja(:,1),Notranja(:,2),"cpentagram")%zriše točke znotraj kroga
hold on
plot(Zunanja(:,1),Zunanja(:,2),"g.")%zunanje točke
plot(x,y1,"r.")%zgornja polovica
plot(x,y2,"r.")%spodnja polovica
hold off

function [priblizek,napaka] = area_pi(v_znotraj,v_zunaj)
%Funkcija sprejme vektorja v_znotraj(vektor koordinat tock znotraj korga) in
%vektor v_zunaj(vektor koordinat tock zunaj kroga).
l1=length(v_znotraj);%točke znotraj
l2=length(v_znotraj)+length(v_zunaj);%število točk znotraj in zunaj
priblizek=4* l1/l2;
napaka = priblizek-pi;%napako dobimo glede na približek - realni pi
end