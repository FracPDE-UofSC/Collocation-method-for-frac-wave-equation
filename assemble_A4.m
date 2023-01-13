function A4 = assemble_A4(x)

% assemble matrix of  int(v(s))

number_of_points = length(x);
A4 = zeros(number_of_points);
for i = 2:number_of_points
    xn = x(i);
    for j = 1:i
        if j==1
            x1 = x(j);x2 =x(j+1) ;% int interval
            A4(i,j) = compute_element_A4(x1,x2,1);
        elseif j>1&j<i
            x1 = x(j-1);x2 =x(j) ;% int interval
            A4(i,j) = compute_element_A4(x1,x2,2);
            x1 = x(j);x2 =x(j+1) ;% int interval
            A4(i,j) = A4(i,j)+ compute_element_A4(x1,x2,1);
        else % j==i
            x1 = x(j-1);x2 =x(j) ;% int interval
            A4(i,j) = compute_element_A4(x1,x2,2);
        end
    end
    
end