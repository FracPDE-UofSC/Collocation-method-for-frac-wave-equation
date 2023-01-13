function result = func_ff(u1,u0,t,beta)
% remain of the integral
result = u1+u1*t+u0+ t^(1-beta)*u1/gamma(2-beta);