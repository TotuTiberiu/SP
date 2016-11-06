a=0:0.1:2;
%Punctul a- length(a)
b=ones(length(a),1);
c=a*b
%Punctul b:
d=b*a
%Punctul c:
e=a.*b
%Se obtine eroare deoarece dimensiunile matricelor nu sunt egale.
clear;