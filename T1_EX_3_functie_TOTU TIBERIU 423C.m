function [  Media_ar_re, a_patrat, mat_aat ] = EX3_functie( a )


Media_ar_re=prod(real(a))/length(a)


a_patrat=a.^a


mat_aat=a*a.'


end

