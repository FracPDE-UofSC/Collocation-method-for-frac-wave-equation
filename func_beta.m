function result = func_beta(beta0,beta1,t)

result = (beta0-beta1).*((1-t)-sin(2.*pi.*(1-t))./(2.*pi))+beta1;