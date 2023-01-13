clc;clear all; close all
T = 1;
number_of_elements_fine = 2880;%the fine mesh number of the elements
alpha0 = 1.7; alpha1 = 1.5;alpha_M = max(alpha0,alpha1);
beta0 = 0.3;  beta1 = 0.1;beta_M = max(beta0,beta1);
alpha_m = min(alpha0,alpha1);beta_m = min(beta0,beta1);
alpha_M = max(alpha0,alpha1);beta_M = max(beta0,beta1);
sig = max(alpha0-1,beta0);
order_VV = 3-sig-alpha_M;
order_UU = 2-sig;
order_V0 = 3-beta0-alpha_M;
order_U0 = 2-beta0;
%% Graded mesh
% sig = min(1-alpha0,-beta0);
r = 2/(3-sig-alpha_M);
% r = 2/(order_VV)
% r = 2/(2-    min(max(alpha0,alpha1),max(beta0,beta1)))
% r = 2/(2-max(alpha0,alpha1));% Graded mesh
% coumpute uh on the finest meshe as the u_true
[x_fine,u_true,v_true] = get_vh_uh(beta0,beta1,alpha0,alpha1,number_of_elements_fine,r,T);
% compute uh on  the corse mesh
number_of_elements = [48,72,96,120,144];%number of the elements
number_of_samples = length(number_of_elements);
[X,U,V] = deal( cell(number_of_samples,1) );
[error_u,error_v]=deal(zeros(number_of_samples,1));
for  i  = 1:number_of_samples
    [X{i},U{i},V{i}] = get_vh_uh(beta0,beta1,alpha0,alpha1,number_of_elements(i),r,T);
    [x,uh,vh] = deal(zeros(number_of_elements(i)+1,1));
    x = X{i,1} ;uh = U{i,1};vh = V{i,1};
    [~, index] = ismember(x,x_fine);% find the corse node index in the fine mesh
    error_v(i) = max(abs(vh(:)-v_true(index)));% compute error
    error_u(i) = max(abs(uh(:)-u_true(index)));% compute error
end
% compute order of the error
[order_v,order_u] = deal(zeros(number_of_samples,1));
for  i = 2:number_of_samples
    H = 1/number_of_elements(i-1);  h=1/number_of_elements(i);
    error_vH =error_v(i-1) ;         error_vh = error_v(i);
    order_v(i) = log2(error_vH/error_vh)/log2( H/h  ) ;
    error_uH =error_u(i-1) ;         error_uh = error_u(i);
    order_u(i) = log2(error_uH/error_uh)/log2( H/h ) ;
end

figure(11)
k= 1;
plot(x_fine,u_true)
hold on
x = X{k};
uh = U{k};
vh = V{k};
plot(x,uh,'o')
legend('u','uh')
title('Graded mesh')



figure(12)
k= 1;
plot(x_fine,v_true)
hold on
x = X{k};
vh = V{k};
plot(x,vh,'o')
legend('v','vh')
title('Graded mesh')
% save dada
a0a1b0b1 = [alpha0,alpha1,beta0,beta1];
[UV_error_UV_order] = [error_u,error_v,order_u,order_v];
M = number_of_elements';
%  diaplay results
if r == 1
    display('This is Uniform Mesh')
else
    display('This is Graded Mesh')
end
table(alpha0,alpha1,beta0,beta1)
table(M,error_u,error_v,order_u,order_v)


%% Uniform mesh
% alpha0 = 1; alpha1 = 1.8;
% beta0 = 0;  beta1 = 0.8;
r = 1;%uniform mesh
%  coumpute uh on the finest mesh as the u_true
[x_fine,u_true,v_true] = get_vh_uh(beta0,beta1,alpha0,alpha1,number_of_elements_fine,r,T);
%  compute uh on  the corse mesh
number_of_samples = length(number_of_elements);
[X,U,V] = deal( cell(number_of_samples,1) );
[error_u,error_v]=deal(zeros(number_of_samples,1));
for  i  = 1:number_of_samples
    [X{i},U{i},V{i}] = get_vh_uh(beta0,beta1,alpha0,alpha1,number_of_elements(i),r,T);
    [x,uh,vh] = deal(zeros(number_of_elements(i)+1,1));
    x = X{i,1} ;uh = U{i,1};vh = V{i,1};
    [~, index] = ismember(x,x_fine);% find the corse node index in the fine mesh
    error_v(i) = max(abs(vh(:)-v_true(index)));% compute error
    error_u(i) = max(abs(uh(:)-u_true(index)));% compute error
end
%  compute order of the error
[order_v,order_u] = deal(zeros(number_of_samples,1));
for  i = 2:number_of_samples
    H = 1/number_of_elements(i-1);  h=1/number_of_elements(i);
    error_vH =error_v(i-1) ;         error_vh = error_v(i);
    order_v(i) = log2(error_vH/error_vh)/log2( H/h  ) ;
    error_uH =error_u(i-1) ;         error_uh = error_u(i);
    order_u(i) = log2(error_uH/error_uh)/log2( H/h ) ;
end

figure(2)
k= 1;
plot(x_fine,u_true)
hold on
x = X{k};
uh = U{k};
plot(x,uh,'o')
legend('u','uh')
title('Uniform mesh')
%  save dada
a0a1b0b1 = [alpha0,alpha1,beta0,beta1];
[UV_error_UV_order] = [error_u,error_v,order_u,order_v];
M = number_of_elements';
%  diaplay results
if r == 1
    display('This is Uniform Mesh')
else
    display('This is Graded Mesh')
end
table(alpha0,alpha1,beta0,beta1)
table(M,error_u,error_v,order_u,order_v)
table(order_UU,order_VV,order_U0,order_V0)
