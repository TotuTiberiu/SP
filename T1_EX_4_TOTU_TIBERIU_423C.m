%punctul a:

z=zeros(1,21);
%z are termenii egali cu 1 din 5 in 5
z(5:5:21)=1;

m=0:20;
n=-5:15;
figure (1)

subplot (1,2,1), stem(m,z),title('Dependenta z de m')
subplot(1,2,2), stem(n,z), title('Dependenta z de n')

%punctul b t=|10-n|:

t=[];

for i=1:1:21;
    if((i-1)>10)
        t(i)=(i-1)-10;
    else if((i-1)<=10)  
        t(i)=10-(i-1);
    end
    end
end

n=0:20;

figure(2)
stem(n,t),title('Dependenta t de n')



%punctul c:

n1=-15:25;

a=length(n1);

x1=[];

for i=1:1:a
    
x1(1,i)=sin(pi/17*n1(i));


end

n2=0:50;

b=length(n2);

x2=[];

for i=1:1:b
    
    x2(1,i)=cos(pi/sqrt(23)*n2(i))

end

figure (3)

stem(n1,x1), title('Grafic stem comun pentru x1 si x2')

hold on;

stem(n2,x2)

hold off;

figure (4)

subplot(2,1,1), stem(n1,x1),title('Graficul stem al lui x1')
subplot(2,1,2), stem(n2,x2),title('Graficul stem al lui x2')

figure (5)

plot(n1,x1,n2,x2),title('Graficul plot comun  al lui x1 si x2')

figure (6)

subplot(2,1,1), plot(n1,x1),title('Graficul plot al lui x1'),ylabel('x1'),grid
subplot(2,1,2), plot(n2,x2),title('Graficul plot al lui x2'),ylabel('x2'),grid

clear