function A = assemble_A_frac(x,beta)
% assembel frac matrix of beta
% int(v(s)(t-s)^(1-beta))
number_of_points = length(x);
for i = 2:number_of_points
    kn = 1; alphan = beta(i);xn = x(i);
    for j = 1:i
        if j==1
            % compute int(ph1*(xn - s)^(1-alphn),s,x1,x2)
            x1 = x(j);x2 = x(j+1);
            A(i,j) = kn/gamma(2-alphan)* compute_element_A_frac(x1,x2,xn,alphan,1);%type==1
        elseif j>1 & j<i
            %computer int(ph2*(xn-s)^(1-alphan),s,x1,x3)%
            x1 = x(j-1);x2 = x(j);
            %computer int(ph2*(xn-s)^(1-alphan),s,x1,x2) %left side int
            A(i,j) = kn/gamma(2-alphan)* compute_element_A_frac(x1,x2,xn,alphan,3);%ph_last fe basis function
            x1 = x(j);x2 = x(j+1);
            %computer int(ph2*(xn-s)^(1-alphan),s,x2,x3)5% right side int
            A(i,j) = A(i,j)+kn/gamma(2-alphan)* compute_element_A_frac(x1,x2,xn,alphan,1);%type==1 %ph1 fe basis function
        elseif j==i
            % computer int(phn*(xn-s)^(1-alphan),s,xn-1,xn)%type==3
            x1 = x(j-1);x2 = x(j);
            A(i,j) = kn/gamma(2-alphan)*compute_element_A_frac(x1,x2,xn,alphan,3);
            
        else
            warning 'wrong of the index'
        end
    end
end