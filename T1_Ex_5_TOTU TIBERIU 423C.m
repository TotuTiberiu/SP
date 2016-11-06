%Exemplu

F=50;
t=0:0.001:0.2;
s=2*sin(2*pi*F*t);

figure(1);
subplot (1,3,1), plot(t,s,'.-'),xlabel('Timp [s]'),grid

%Punctul a:

t=0:0.01:0.2;
s=2*sin(2*pi*F*t);

subplot (1,3,2), plot(t,s,'.-'),xlabel('Timp [s]'),grid

t=0:0.0002:0.2;
s=2*sin(2*pi*F*t);

subplot (1,3,3), plot(t,s,'.-'),xlabel('Timp [s]'),grid

%Primul si ultimul grafic sunt la fel intrucat acestea ating si maximul
%amplitudinii, ultimul avand un pas mult mai fin decat primul. Diferentele
%apar la cel de-al doilea grafic, acesta trebuind sa fie o linie dreapta
%intru-cat argumentul sinusului ar fi mereu un multiplu de pi luand pasul
%de 0.01. Acest fapt nu se int inampla deoarce pi are o valoare fixa iar
%sin(pi) nu va da exact 0. Valoarea sa este intr-adevar foarte mica, de
%ordinul fempto, dar apare totusi ca fiind o variatie pe grafic.


%Punctul b: Primul grafic si cel de-al treilea grafic prezinta un semnal cu
%perioada de 1/50 si anume 0.02 secunde. Cel de-al doilea grafic este
%aperiodic.


%Punctul c: Vom afisa pe ecran doar 5 perioade ale semnalului sinusoidal

F=50;
f=20;
t=0:0.001:0.1;
s1=2*sin(2*pi*F*t);
s2=2*cos(2*pi*f*t);

figure (2)

plot(t,s1),xlabel('Timp [s]'),grid
hold on;
plot(t,s2,'r')

