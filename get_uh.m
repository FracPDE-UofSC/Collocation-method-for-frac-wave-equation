function uh = get_uh(vh,x,f)
%% step 2: uh = double integral
%% f = u1*t+u0
number_of_ponits = length(x);
uh = zeros(number_of_ponits,1);
for i = 1:number_of_ponits% Loop points
    E1 =0;E2 =0;
    for j = 2:i
        x1 = x(j-1); x2 = x(j);
        v1 = vh(j-1); v2 = vh(j);
        E1 = E1 + int_ph(v1,v2,x1,x2,1)  + int_ph(v1,v2,x1,x2,2);
        E2 = E2 + int_phs(v1,v2,x1,x2,1) + int_phs(v1,v2,x1,x2,2);
    end
    Ex(i) = x(i)*E1 - E2; % right hand int = int(v(s)(x-s),s,[0,x])
    uh(i) =  Ex(i) + f(i);%
end