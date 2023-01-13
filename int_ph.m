function result = int_ph(c1,c2,x1,x2,type)
% compute the integral of the c1*ph1 or c2*ph2 on the elements[x1,x2]
% if type == 1  c1*ph1
% else type == 2 c3*ph2
if type == 1 % ph1
    result = c1*(-(1/2)*(-x1^2+x2^2)/(x2-x1)+x2);
else %ph2 left side
    result = c2*(-(1/2)*x1+(1/2)*x2);
end