clear all
clc
E = 12;
Ryuk = 0.8;
L = 4.8e-3;
C = 100e-3;
D = 0.4;
f = 1e3;
T = 1/f;
Vds = 1.2;
Vd= 0.7;
Vprimer = E - Vds;
Vyuk = D*E*(1/n);
Vsekonder_ort = Vyuk + Vd;
Vsekonder = Vsekonder_ort/D;
n= Vprimer/Vsekonder;

Iyuk = Vyuk/Ryuk;
Pcikis = Vyuk * Iyuk;
Igiris = (Pcikis+(Vd*Iyuk))/(E-Vds*D-(Vd*(1-D)));
Pgiris = E*Igiris;
verim = (Pcikis/Pgiris)*100;
Ice_ort = D*Igiris;
Vce_tepe = E + n*Vsekonder;
Ice_etkin = (E/n)*sqrt(D)

