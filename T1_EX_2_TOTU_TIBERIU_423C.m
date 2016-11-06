%generam vectorul
a=randn(1,10);
b=[];
t=0;
%introducem valorile negative intr-un vector b
for i=1:1:10
    if(a(i)<0)
        t=t+1;
       b(t)= a(i);
    end
end
%afisam vectorul b, adica valorile negative ale vectorului a
b(1:t)
clear