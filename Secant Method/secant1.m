clear; clc; close all;

f = @(x) x.^3-0.165*x.^2+3.993*10.^-4;

xq=0:0.1:20;
plot(xq,f(xq));
set(gca,'xAxisLocation','origin')

a =0.05; b = 0.02;

c = (a*f(b) - b*f(a))/(f(b) -f(a));

tol = 1e-6;
counter = 0;
while abs(f(c)) > tol
  a = b;
  b = c;

  c = (a*f(b) - b*f(a))/(f(b) -f(a));
  counter = counter + 1;

 end
