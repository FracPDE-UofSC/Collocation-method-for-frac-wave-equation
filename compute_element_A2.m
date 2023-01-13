function result = compute_element_A2(x1,x2,xn,type)
% assemble elements of  double integral matrix 
% int(int(v(y))dyds) = int((t-s)v(s)ds)
h =( x2 - x1);
if type==1 % ph1 first fe basis function
    result = -(1/3)*x1^3-(1/6)*x2^3+(1/2)*x1^2*x2+(1/2)*xn*x1^2+(1/2)*xn*x2^2-xn*x2*x1;
    result =1/h*result;
elseif type==2%last fe basis function
    result = (1/3)*x1^3-(1/3)*x2^3+(1/2*(x1+xn))*(-x1^2+x2^2)-xn*x1*(x2-x1);
    result = 1/h*result;
else
    warning 'wrong of the type'
end