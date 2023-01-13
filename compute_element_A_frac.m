function result = compute_element_A_frac(x1,x2,xn,alphan,type)

if type==1%compute the first integral [x1,x2]
    h = x2-x1;
    a = 1/(2-alphan)*( (xn-x1)^(2-alphan) - (xn-x2)^(2-alphan)  );
    b = 1/(2-alphan)*(  x1*(xn-x1)^(2-alphan)-x2*(xn-x2)^(2-alphan) )+...
        1/( (2-alphan)*(3-alphan)  )*(  (xn-x1)^(3-alphan) - (xn-x2)^(3-alphan)   );
    result =  1/h*(x2*a - b);%compute the first integral [x1,x2]
elseif type==3% compute the last integral [x_(last-1),x_last]
    h = x2-x1;
    a = 1/(2-alphan)*( (xn-x1)^(2-alphan) - (xn-x2)^(2-alphan)  );
    b = 1/(2-alphan)*(  x1*(xn-x1)^(2-alphan)-x2*(xn-x2)^(2-alphan) )+...
        1/( (2-alphan)*(3-alphan)  )*(  (xn-x1)^(3-alphan) - (xn-x2)^(3-alphan)   );
    result =  1/h*(b - x1*a);%% compute the last integral [x_(last-1),x_last]
else
    warning 'wrong of the type'
end
