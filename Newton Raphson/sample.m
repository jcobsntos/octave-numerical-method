x0=2.5;
maxIter=50;
tolX=1e-4;

%%Computation using Newton Raphson
x=x0;
xold=x0;
for i=1:maxIter
  f=x^3-4*x-9;
  df=-1+1/x;
  x=x-f/df;

  err(i)=abs(x-xold);
  xold=x;
  if (err(i)<tolX) || (i>maxIter)
    break;
  end
end
X=['Value of x is ',' ', num2str(x), ' after',' ' ,num2str(i),'  iterations'];
disp(X)
prevErr=err(1:3);
CurErr=err(2:4);
disp('-----------------------------Previous and Current Errors-------------')
disp([prevErr;CurErr])
disp('-----------------Log of Previous and Current Errors---------------')
disp([log(prevErr);log(CurErr)])
plot(log(prevErr),log(CurErr))




