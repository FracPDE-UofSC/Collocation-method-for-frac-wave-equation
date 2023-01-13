function result = int_phs(c1,c2,x1,x2,type)
% compute the integral of the c1*ph1*s or c2*ph2*s on the elements[x1,x2]
% if type == 1  c1*ph1*s
% else type == 2 c2*ph2*s
if type == 1%ph1  
    result = c1*(-(1/3)*x1^2+(1/6)*x2*x1+(1/6)*x2^2);
else %ph2 left side
    result = c2*(-(1/6)*x1^2-(1/6)*x2*x1+(1/3)*x2^2);
end