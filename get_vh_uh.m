function [x,uh,vh] = get_vh_uh(beta0,beta1,alpha0,alpha1,number_of_elements,r,T)



u0 = 1;% u0 = u(0)
u1 = 1;% u1 = u'(0)  initial condition
number_of_points = number_of_elements + 1;
[x,u_true,v,uh,vh,hf,ff,alpha,f] = deal(zeros(number_of_points,1));
for i = 1:number_of_elements+1
    x(i) = ((i-1)/(number_of_elements))^r*T;
    alpha(i) = func_alpha(alpha0,alpha1,x(i));
    beta(i) = func_beta(beta0,beta1,x(i));
    u_true(i) = func_u(x(i));%true solution
    hf(i) = func_hf(x(i),u1,u0);%return uh's load vector:  hf = u1*t+u0
    f(i) = func_f(x(i),u1,u0);%load vector
    ff(i) = -func_ff(u1,u0,x(i),beta(i));
end
[A,A1,A2,A_beta,A4,A_alpha] = deal(zeros(number_of_points));
A_alpha = assemble_A_frac(x,alpha); % assembel frac matrix of beta  int(v(s)(t-s)^(1-alpha))
A_beta = assemble_A_frac(x,beta);% assembel frac matrix of beta  int(v(s)(t-s)^(1-beta))
A1 = eye(number_of_points);%assemble identity matrix
A2 = assemble_A2(x);% assemble double integral matrix    int(int(v(y))dyds) = int((t-s)v(s)ds)
A4 = assemble_A4(x);% int(v(s)ds)
A = A1 + A_alpha + A2 + A_beta + A4;
ff(1) = -(u1 + u0);
F = ff+f;
vh = A\F;
uh = get_uh(vh,x,hf);
end









