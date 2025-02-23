clc; clear; close all;
f= @(x) x^4-x^3-x^3-4;
a = 1;
b = 9;
for i=1:100
  c=(a+b)/2;
  if f(c) > 0
    b=c;
  else a=c;
    end
end
a=1; b=9; p=c;
for i=1:100
  c=(a+b)/2;
  error(i)=f(c)-f(p);
  if f(c) > 0
    b=c;
  else a=c;
    end
end
fprintf('Root of given equation is %f',p);
plot(error);
title('Plot of error by bisection method')
xlabel('Number of iterations')
ylabel('Error')
grid on
