
function result = compute_element_A4(x1,x2,type)

% compute element of  int(v(s))
% assemble matrix of the
% int(v(s))
if type ==1 %int ph1
    result = (x2*(x2-x1)+(1/2)*x1^2-(1/2)*x2^2)/(x2-x1);
else%type==2 %int phn last
    result = (-(1/2)*x1^2+(1/2)*x2^2-x1*(x2-x1))/(x2-x1);
end