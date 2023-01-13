function A2 = assemble_A2(x)
% assemble double integral matrix 
% int(int(v(y))dyds) = int((t-s)v(s)ds)
number_of_points = length(x);
A2 = zeros(number_of_points);
for i = 2:number_of_points
    xn = x(i);
    for j = 1:i
        if j==1
            x1 = x(j);x2 =x(j+1) ;% int interval
            A2(i,j) = compute_element_A2(x1,x2,xn,1);
        elseif j>1&j<i
            x1 = x(j-1);x2 =x(j) ;% int interval
            A2(i,j) = compute_element_A2(x1,x2,xn,2);
            x1 = x(j);x2 =x(j+1) ;% int interval
            A2(i,j) = A2(i,j)+ compute_element_A2(x1,x2,xn,1);
        else % j==i
            x1 = x(j-1);x2 =x(j) ;% int interval
            A2(i,j) = compute_element_A2(x1,x2,xn,2);
        end
    end
    
end