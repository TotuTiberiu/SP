F=1/0.5*1000;
t=0:0.0001:0.005;
%Facem din semnalul binar ce ar fi dat doar de randi un semnal sinusoidal

%Am ales 10 perioade
%Un semnal binar se reprezinta ca un semnal dreptunghiular ce isi pastreaza
%valoarea pe parcursul unei perioade. Mai jos, comentat, este si semnalul
%sinusoidal in functie de valorile aleatoare.

n=length(t);
sc=zeros(1,n);
for i=1:5:n
    sc(1,i)=randi([0,1],1)
 
end
    
    

for i=1:5:n
    if(sc(i)==1)
        if(i<n)
        sc(i:i+4)=1;
        else
            continue
        end
    else if (i<n)
        sc(i:i+4)=0;
    else
       continue
         end
    end
end

figure (1)

plot(t,sc),xlabel('Timp [s]'),grid


%Am construit semnalul cu un for deoarece nu ma lasa sa imultesc functia
%randi cu o matrice

%for i=1:1:n
   % sc(i)=sc(i) *sin(2*pi*F*t(i))
%end

%figure (1)
%plot(t,sc),xlabel('Timp [s]'),grid



Fs=12000;
w0=2*pi*F/Fs;
N=0.5*12;
r=0:N-1;
s=zeros(1,length(r))
for i=1:1:length(r)
    s(i)=sc(1,1);
end

figure (2)

stem(r,s),xlabel('Time [s]'),grid

clear

%Esantionul se realizeaza pe o perioada. Pe o perioada functia ce defineste
%bite-ul isi pastreaza valoarea. Astfel nu vom avea variatii ale valoriilor
%esantioanelor. Mai jos este si pentru modelul de functie sinusoidala.




%Fs=12000;
%w0=2*pi*F/Fs;
%N=0.5*12;
%r=0:N-1;
%s=zeros(1,length(r))
%for i=1:1:length(r)
%    s(1,i)=sc(1,1) * sin(w0*n);
%end
%
%figure (2)
%
%stem(r,s),xlabel('Time [s]'),grid





