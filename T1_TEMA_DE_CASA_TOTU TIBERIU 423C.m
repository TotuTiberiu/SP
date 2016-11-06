%Am scris toata tema intr-un singur program Matlab. Prima figura corespunde
%cerintei 1, cea de-a doua corespunde cerintei 2, urmatoarele patru
%corespund cerintei 3, cea de-a saptea corespunde cerintei 4, iar cea de-a
%opta corespunde cerintei 5.
%La primele doua cerinte apar erori legate de indexare intru-cat am
%modifica voit i-ul cu care am apelat for-ul in interiorul for-ului. Am
%facut acest lucru pentru a nu mai introduce inca o variabila suplimentara
%si pentru ca am vazut ca matlabul nu genereaza eroare din acest motiv.
%Pentru cel de-al doilea punct am utilizat calculul matematic de mana pe
%care l-am introdus apoi in matlab.

%Cea de-a treia parte este mult mai voluminoasa decat celelalte intru-cat
%nu am vrut sa folosesc vro functie specifica matlab ci am dezvoltat
%prorpiul algoritm. Am generat intai un vector cu dimensiunea egala cu
%numarul total de puncte de pe axa timpului, dupa care am generat din
%perioada in perioada un numar aleator dintre cele dorite utilizand functia
%randi si aplicandu-i apoi cateva constrangeri, dupa care am umplut spatiul
%dintre aceste puncte pentru ca functia sa isi pastreze aceeasi valoare pe
%durata unei perioade. Totodata am folosit in interiorul unor if-uri un if
%de care nu am mai avut nevoie si l-am comentat.
%La ultimele doua puncte am aplicat doar anumite functii matematice.
%Nu am pus accent pe culoarea, denumirea sau alte aspecte estetice ale
%graficelor si nici nu am tinut sa fac un algoritm cat mai optimizat si
%importabil. As fi putut sa atribui unor variabile o serie de valori ce
%le-am folosit ca atare dar nu am considera a fi necesar acest lucru.
%Am folosit clear la fiecare sfarsit de program.













%Punctul 1:

T=2;
t1=0:0.002:6;
s1=zeros(1,length(t1));
%Construim semnalul printr-o functie for
j=0;
for i=2:0.002:8
    
        j=j+1;
    c=floor(i/T);
        i=i-c*T;
        
    if(i<=T/4)
       s1(1,j)=0.5;
    else
        s1(1,j)=-1;
    end
end

t2=0:0.02:6;
s2=zeros(1,length(t2));
j=0;
for i=2:0.02:8
    
        j=j+1;
    c=floor(i/T);
        i=i-c*T;
        
    if(i<=T/4)
       s2(1,j)=0.5;
    else
        s2(1,j)=-1;
    end
end

t3=0:0.2:6;
s3=zeros(1,length(t3));
j=0;
for i=2:0.2:8
    
        j=j+1;
    c=floor(i/T);
        r=i-c*T;
        
    if(r<=T/4)
       s3(1,j)=0.5;
    else
        s3(1,j)=-1;
    end
end

figure (1)

subplot(1,3,1), plot(t1,s1,'.-r'),xlabel('Title [s]'),grid,title('Semnal dreptungiular periodic in functie de t1')

subplot(1,3,2), plot(t2,s2,'.-r'),xlabel('Title [s]'),grid,title('Semnal dreptungiular periodic in functie de t2')

subplot(1,3,3), plot(t3,s3,'.-r'),xlabel('Title [s]'),grid,title('Semnal dreptungiular periodic in functie de t3')

%Am luat tot doar 3 perioade pentru a putea observa diferentele dintre
%grafice. Intru-cat rezolutia celui de-al treilea grafic este foarte
%scazuta acesta nu mai prezinta o scadere brusca de la 1 la -0.5.


clear

%Punctul b: Consideram ca panta este egala cu +1V/s la dreapta ce
%corespunde urcarii semnalului triunghiular. Vom folosi formulele
%matematice urmatoare: (y-y0)=m(x-x0) (ecuatia dreptei formata dintr-un
%punct si panta) o vom folosi pentru a afla ecuatia dreptei de urcare, iar
%(y-y1)/(y2-y1)=(x-x1)/(x2-x1) (Ecuatia dreptei foramta din doua puncte)
%pentru a afla ecuatia dreptei de coborare. 
%Vom considera ca graficul trece prin origine pe partea crescatoare a
%graficului. Ca si puncte pentru (x1,y1) si (x2,y2) le vom lua ca fiind
%(1,1) si (3,-2).

T=5;
m=1;

t1=0:0.002:15;
t2=0:0.02:15;
t3=0:0.2:15;

s1=zeros(1,length(t1));
s2=zeros(1,length(t2));
s3=zeros(1,length(t3));

j=0;

for i=5:0.002:20
    j=j+1;
    r=j-1;
    c=floor(i/T);
    i=i-c*T;
    if(j==1)
        s1(1,j)=m*(t1(1,j)-0)+0;
    else if (i<=1)
            s1(1,j)=m*(t1(1,j)-0)+0-5*(c-1);
            %Am adunca 5*(c-1) pentru a modela si celelalte perioade
        else if (i>=3)
                s1(1,j)=m*(t1(1,j)-0)+0-5*c;
            else if(i>1&&i<3&&c==1)
            s1(1,j)=(-2-1)*((t1(1,j)-1)/(3-1))+1-5*(c-1);
                else
                    s1(1,j)=(-2-1)*((t1(1,j)-1)/(3-1))+1+(7.5*(c-1));
                end
            end
        end
    end
end



j=0;

for i=5:0.02:20
    j=j+1;
    r=j-1;
    c=floor(i/T);
    i=i-c*T;
    if(j==1)
        s2(1,j)=m*(t2(1,j)-0)+0;
    else if (i<=1)
            s2(1,j)=m*(t2(1,j)-0)+0-5*(c-1);
        else if (i>=3)
                s2(1,j)=m*(t2(1,j)-0)+0-5*c;
            else if(i>1&&i<3&&c==1)
            s2(1,j)=(-2-1)*((t2(1,j)-1)/(3-1))+1-5*(c-1);
                else
                    s2(1,j)=(-2-1)*((t2(1,j)-1)/(3-1))+1+(7.5*(c-1));
                end
            end
        end
    end
end



j=0;

for i=5:0.2:20
    j=j+1;
    r=j-1;
    c=floor(i/T);
    i=i-c*T;
    if(j==1)
        s3(1,j)=m*(t3(1,j)-0)+0;
    else if (i<=1)
            s3(1,j)=m*(t3(1,j)-0)+0-5*(c-1);
        else if (i>=3)
                s3(1,j)=m*(t3(1,j)-0)+0-5*c;
            else if(i>1&&i<3&&c==1)
            s3(1,j)=(-2-1)*((t3(1,j)-1)/(3-1))+1-5*(c-1);
                else
                    s3(1,j)=(-2-1)*((t3(1,j)-1)/(3-1))+1+(7.5*(c-1));
                end
            end
        end
    end
end



figure (2)

subplot(1,3,1),plot(t1,s1),grid,xlabel('Timp [s]'),title('Semnal triungiular periodic in functie de t1')
subplot(1,3,2),plot(t2,s2),grid,xlabel('Timp [s]'),title('Semnal triungiular periodic in functie de t2')
subplot(1,3,3),plot(t3,s3),grid,xlabel('Timp [s]'),title('Semnal triungiular periodic in functie de t3')


clear

%Punctul 3:  Precum in exercitiul 6, fiecare nivel durat 0.25 de secunde
%O sa luam 30 de astfel de nivele

T=0.25;
%Schimbam paul deoarece nu se va suprapune peste punctele necesare in care
%ar trebui sa generam valori aleatoare. Totodata vom lua doar 2 rezolutii.
t1=0:0.001:7.5;
t2=0:0.01:7.5;

n1=length(t1);
n2=length(t2);

s11=zeros(1,n1);
s12=zeros(1,n2);

s21=zeros(1,n1);
s22=zeros(1,n2);

s31=zeros(1,n1);
s32=zeros(1,n2);

s41=zeros(1,n1);
s42=zeros(1,n2);

for i=1:250:n1
    
    s11(1,i)=randi([-1,1],1);
    while(s11(1,i)==0)
        s11(1,i)=randi([-1,1],1);
    end
end

for i=1:25:n2
    
    s12(1,i)=randi([-1,1],1);
    while(s12(1,i)==0)
        s12(1,i)=randi([-1,1],1);
    end
end

for i=1:250:n1
    
    s21(1,i)=randi([-3,3],1);
    while(s21(1,i)==0 || s21(1,i)==-2 || s21(1,i)==2)
        s21(1,i)=randi([-3,3],1);
    end
end

for i=1:25:n2
    
    s22(1,i)=randi([-3,3],1);
    while(s22(1,i)==0 || s22(1,i)==-2 || s22(1,i)==2)
        s22(1,i)=randi([-3,3],1);
    end
end

for i=1:250:n1
    
    s31(1,i)=randi([-5,5],1);
    while(s31(1,i)==0 || s31(1,i)==-2 || s31(1,i)==2 || s31(1,i)==4|| s31(1,i)==-4)
        s31(1,i)=randi([-5,5],1);
    end
end

for i=1:25:n2
    
    s32(1,i)=randi([-5,5],1);
    while(s32(1,i)==0 || s32(1,i)==-2 || s32(1,i)==2 || s32(1,i)==4 || s32(1,i)==-4)
        s32(1,i)=randi([-5,5],1);
    end
end



for i=1:250:n1
    
    s41(1,i)=randi([-7,7],1);
    while(s41(1,i)==0 || s41(1,i)==-2 || s41(1,i)==2 || s41(1,i)==4|| s41(1,i)==-4 || s41(1,i)==6 || s41(1,i)==-6)
        s41(1,i)=randi([-7,7],1);
    end
end

for i=1:25:n2
    
    s42(1,i)=randi([-7,7],1);
    while(s42(1,i)==0 || s42(1,i)==-2 || s42(1,i)==2 || s42(1,i)==4 || s42(1,i)==-4 || s42(1,i)==6 || s42(1,i)==-6)
        s42(1,i)=randi([-7,7],1);
    end
end


for i=1:250:n1

    if(s11(i)==1)
        if(i<n1)
        s11(i:i+248)=1;

            s11(i+249)=1;

        else
            continue
        end
    else if (i<n1)
        s11(i:i+248)=-1;

            s11(i+249)=-1;

    else
       continue
         end
    end
end

for i=1:25:n2

    if(s12(i)==1)
        if(i<n2)
        s12(i:i+23)=1;
            s12(i+24)=1;
        else
            continue
        end
    else if (i<n2)
        s12(i:i+23)=-1;
            s12(i+24)=-1;
    else
       continue
         end
    end
end


for i=1:250:n1

    if(s21(i)==1)
    if(i<n1)
        s21(i:i+248)=1;
        %if(t>1)
            s21(i+249)=1;
        %end
        else
            continue
    end
    end
    if (s21(i)==-1)
        if(i<n1)
        
        s21(i:i+248)=-1;
        %if(i>1)
           s21(i+249)=-1;
        %end
    else
       continue
        end
    end
    if (s21(i)==3)
        if(i<n1)
        s21(i:i+248)=3;
 %       if(i>1)
           s21(i+249)=3;
   %     end
    else
       continue
        end
    end
    if (s21(i)==-3)
        if(i<n1)
        s21(i:i+248)=-3;
 %       if(i>1)
           s21(i+249)=-3;
   %     end
    else
       continue
        end
    end
end

for i=1:25:n2

    if(s22(i)==1)
        if(i<n2)
        s22(i:i+23)=1;
    %    if(i>1)
          s22(i+24)=1;
      %  end
        else
            continue
        end
    end
    if (s22(i)==-1)
        if(i<n2)
        
        s22(i:i+23)=-1;
       % if(i>1)
           s22(i+24)=-1;
        %end
    else
       continue
        end
    end
    if (s22(i)==3)
        if(i<n2)
        s22(i:i+23)=3;
  %      if(i>1)
          s22(i+24)=3;
    %    end
    else
       continue
        end
    end
    if (s22(i)==-3)
        if(i<n2)
        s22(i:i+23)=-3;
     %   if(i>1)
            s22(i+24)=-3;
       % end
    else
       continue
        end
    end
end



for i=1:250:n1

    if(s31(i)==1)
        if(i<n1)
        s31(i:i+248)=1;
 %       if(i>1)
          s31(i+249)=1;
   %     end
        else
            continue
        end
    end
    if (s31(i)==-1)
        if(i<n1)
        s31(i:i+248)=-1;
    %    if(i>1)
            s31(i+249)=-1;
      %  end
    else
       continue
        end
    end
    if (s31(i)==3)
        if(i<n1)
        s31(i:i+248)=3;
    %    if(i>1)
            s31(i+249)=3;
      %  end
    else
       continue
        end
    end
    if (s31(i)==-3)
        if(i<n1)
        s31(i:i+248)=-3;
   %     if(i>1)
          s31(i+249)=-3;
     %   end
    else
       continue
        end
    end
    
    if (s31(i)==-5)
        if(i<n1)
        s31(i:i+248)=-5;
 %       if(i>1)
          s31(i+249)=-5;
   %     end
    else
       continue
        end
    end
    
    
    if (s31(i)==5)
        if(i<n1)
        s31(i:i+248)=5;
    %    if(i>1)
           s31(i+249)=5;
      %  end
    else
       continue
        end
    end
end



for i=1:25:n2

    if(s32(i)==1)
        if(i<n2)
        s32(i:i+23)=1;
   %     if(i>1)
          s32(i+24)=1;
     %   end
        else
            continue
        end
    end
    if (s32(i)==-1)
        if(i<n2)
        s32(i:i+23)=-1;
      %  if(i>1)
         s32(i+24)=-1;
        %end
    else
       continue
        end
    end
    if (s32(i)==3)
        if(i<n2)
        s32(i:i+23)=3;
    %    if(i>1)
           s32(i+24)=3;
      %  end
    else
       continue
        end
    end
    if (s32(i)==-3)
        if(i<n2)
        s32(i:i+23)=-3;
     %   if(i>1)
           s32(i+24)=-3;
       % end
    else
       continue
        end
    end
    
    if (s32(i)==-5)
        if(i<n2)
        s32(i:i+23)=-5;
   %     if(i>1)
          s32(i+24)=-5;
     %   end
    else
       continue
        end
    end
    
    
    if (s32(i)==5)
        if(i<n2)
        s32(i:i+23)=5;
      %  if(i>1)
          s32(i+24)=5;
        %end
    else
       continue
        end
    end
end


for i=1:250:n1

    if(s41(i)==1)
        if(i<n1)
        s41(i:i+248)=1;
 %       if(i>1)
           s41(i+249)=1;
   %     end
        else
            continue
        end
    end
    if (s41(i)==-1)
        if(i<n1)
        s41(i:i+248)=-1;
   %     if(i>1)
            s41(i+249)=-1;
     %   end
    else
       continue
        end
    end
    if (s41(i)==3)
        if(i<n1)
        s41(i:i+248)=3;
    %    if(i>1)
            s41(i+249)=3;
      %  end
    else
       continue
        end
    end
    if (s41(i)==-3)
        if(i<n1)
        s41(i:i+248)=-3;
     %   if(i>1)
            s41(i+249)=-3;
       % end
    else
       continue
        end
    end
    
    if (s41(i)==-5)
        if(i<n1)
        s41(i:i+248)=-5;
        %if(i>1)
            s41(i+249)=-5;
       % end
    else
       continue
        end
    end
    
    
    if (s41(i)==5)
        if(i<n1)
        s41(i:i+248)=5;
     %   if(i>1)
            s41(i+249)=5;
       % end
    else
       continue
        end
    end
    
     if (s41(i)==7)
         if(i<n1)
        s41(i:i+248)=7;
      %  if(i>1)
         s41(i+249)=7;
      %  end
    else
       continue
         end
     end
    
      if (s41(i)==-7)
          if(i<n1)
        s41(i:i+248)=-7;
       % if(i>1)
            s41(i+249)=-7;
      %  end
    else
       continue
          end
      end
    
end



for i=1:25:n2

    if(s42(i)==1)
        if(i<n2)
        s42(i:i+23)=1;
      %  if(i>1)
            s42(i+24)=1;
      %  end
        else
            continue
        end
    end
    if (s42(i)==-1)
        if(i<n2)
        s42(i:i+23)=-1;
   %     if(i>1)
           s42(i+24)=-1;
    %    end
    else
       continue
        end
    end
    if (s42(i)==3)
        if(i<n2)
        s42(i:i+23)=3;
    %    if(i>1)
           s42(i+24)=3;
     %   end
    else
       continue
        end
    end
    if (s42(i)==-3)
        if(i<n2)
        s42(i:i+23)=-3;
     %   if(i>1)
           s42(i+24)=-3;
       % end
    else
       continue
        end
    end
    
    if (s42(i)==-5)
        if(i<n2)
        s42(i:i+23)=-5;
   %     if(i>1)
           s42(i+24)=-5;
     %   end
    else
       continue
        end
    end
    
    
    if (s42(i)==5)
        if(i<n2)
        s42(i:i+23)=5;
     %   if(i>1)
            s42(i+24)=5;
       % end
    else
       continue
        end
    end
    
     if (s42(i)==7)
         if(i<n2)
        s42(i:i+23)=7;
   %     if(i>1)
         s42(i+24)=7;
     %   end
    else
       continue
         end
     end
    
      if (s42(i)==-7)
          if(i<n2)
        s42(i:i+23)=-7;
      %  if(i>1)
         s42(i+24)=-7;
        %end
      else
       continue
          end
      end
    
end


figure (3)
subplot(1,2,1),plot(t1,s11),xlabel('Timp [s]'),grid,title('Dependenta impulsului aleator 1 cu o rezolutie de 1ms')
subplot(1,2,2),plot(t2,s12),xlabel('Timp [s]'),grid,title('Dependenta impulsului aleator 1 cu o rezolutie de 10ms')
figure(4)
subplot(1,2,1),plot(t1,s21),xlabel('Timp [s]'),grid,title('Dependenta impulsului aleator 2 cu o rezolutie de 1ms')
subplot(1,2,2),plot(t2,s22),xlabel('Timp [s]'),grid,title('Dependenta impulsului aleator 2 cu o rezolutie de 10ms')
figure(5)
subplot(1,2,1),plot(t1,s31),xlabel('Timp [s]'),grid,title('Dependenta impulsului aleator 3 cu o rezolutie de 1ms')
subplot(1,2,2),plot(t2,s32),xlabel('Timp [s]'),grid,title('Dependenta impulsului aleator 3 cu o rezolutie de 10ms')
figure(6)
subplot(1,2,1),plot(t1,s41),xlabel('Timp [s]'),grid,title('Dependenta impulsului aleator 4 cu o rezolutie de 1ms')
subplot(1,2,2),plot(t2,s42),xlabel('Timp [s]'),grid,title('Dependenta impulsului aleator 4 cu o rezolutie de 10ms')



clear









%Punctul 4:

F=1/3;
t1=0:0.002:12;
t2=0:0.02:12;
t3=0:0.2:12;

s1=0.8*sin(2*pi*F*t1);
s2=0.8*sin(2*pi*F*t2);
s3=0.8*sin(2*pi*F*t3);

j=0;
for i=0:0.002:12
    j=j+1;
    if(s1(j)<0)
        s1(j)=0;
    end
end

j=0;
for i=0:0.02:12
    j=j+1;
    if(s2(j)<0)
        s2(j)=0;
    end
end

j=0;
for i=0:0.2:12
    j=j+1;
    if(s3(j)<0)
        s3(j)=0;
    end
end

figure(7)
subplot(1,3,1),plot(t1,s1),grid,title('Mono-alt cu t1'),xlabel('Timp [s]')
subplot(1,3,2),plot(t2,s2),grid,title('Mono-alt cu t2'),xlabel('Timp [s]')
subplot(1,3,3),plot(t3,s3),grid,title('Mono-alt cu t3'),xlabel('Timp [s]')


clear

%Punctul 5


F=1/4;

t1=0:0.002:12;
t2=0:0.02:12;
t3=0:0.2:12;

s1=1.5*sin(2*pi*F*t1);
s2=1.5*sin(2*pi*F*t2);
s3=1.5*sin(2*pi*F*t3);

j=0;
for i=0:0.002:12
    j=j+1;
    if(s1(j)<0)
        s1(j)=abs(s1(j));
    end
end

j=0;
for i=0:0.02:12
    j=j+1;
    if(s2(j)<0)
        s2(j)=abs(s2(j));
    end
end

j=0;
for i=0:0.2:12
    j=j+1;
    if(s3(j)<0)
        s3(j)=abs(s3(j));
    end
end
    

figure(8)
subplot(1,3,1),plot(t1,s1),grid,xlabel('Timp [s]'),title('Semnal red. dubla alt. dupa t1')
subplot(1,3,2),plot(t2,s2),grid,xlabel('Timp [s]'),title('Semnal red. dubla alt. dupa t2')
subplot(1,3,3),plot(t3,s3),grid,xlabel('Timp [s]'),title('Semnal red. dubla alt. dupa t3')


clear
    

