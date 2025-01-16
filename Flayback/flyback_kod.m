clear all
clc
V_yuk = 24;
R_yuk = 0.8;
D = 0.5;
f = 1e3;
T = 1 / f;
Vce = 1.2;
Vdiyot = 0.7;
n = 4;

I_yuk = V_yuk / R_yuk;
Vprimer = n*(V_yuk+Vdiyot);
Vsekonder = V_yuk+Vdiyot;
E = (((1-D)*n*(V_yuk+Vdiyot))+D*Vce)/D;
Pyuk = V_yuk^2/R_yuk;

syms Igiris
Pgiris = E * Igiris;
Ptransistor = Vce * Igiris; 
Pdiyot = Vdiyot * I_yuk;
eqn_Igiris = Pgiris == Ptransistor + Pyuk + Pdiyot;
Igiris = double(solve(eqn_Igiris, Igiris));

Pgiris = E * Igiris;
Verim = Pyuk / Pgiris * 100;

Ice = Igiris;

Ip_tepe = (2 * Igiris) / D;


fun = @(t) ((I_yuk/(D*T))*t).^2;
Ice_etkin = sqrt((1/T)*integral(fun,0,D*T));

Vce_tepe = E+n*Vsekonder;

Lm = E*D*(T)/I_yuk;

Ipmax = (E*D)/(Lm*f);



Igiris_max = Ip_tepe;

Idiyot_max = Ip_tepe * n;

Vyuk_min = V_yuk - Vdiyot;

Vyuk_max = V_yuk + Vdiyot;

Vce_max = Vce_tepe;

Ip_max = Ip_tepe;

disp(I_yuk);
disp(Verim);
disp(Ice);
disp(Ip_tepe);
disp(Ice_etkin);
disp(Vce_tepe);
disp(Lm);
disp(Igiris_max);
disp(Idiyot_max);
disp(Vyuk_min);
disp(Vyuk_max);
disp(Vce_max);
disp(Ip_max);