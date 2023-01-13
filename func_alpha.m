function result = func_alpha(alpha0,alpha1,t)

result = (alpha0-alpha1).*((1-t)-sin(2.*pi.*(1-t))./(2.*pi))+alpha1;