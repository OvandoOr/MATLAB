clear 
clc
pause on

k=9;
xn=1:20;
resultado=zeros(1,20);

h=[2 0 0 0 0 0 0 0]; %h=impulso unitario
m=length(h);
H=[h,zeros(1,20-m)];
%H= H([ end-k+1:end 1:end-k ]);

x=[-3 9 11 -4 6 2 -1 -2];
n=length(x);
X=[x,zeros(1,20-n)];
X= X([ end-k+1:end 1:end-k ]);

impulso=zeros(1,20);
subplot(3,1,3)
stem(xn,impulso,'r','MarkerFaceColor','green')

%Hi=[hi,zeros(1,40-n)];

  for i=1:20
      
    resultado=X.*H;
    impulso(i)=sum(resultado);
    
    subplot(3,1,2);
    stem(xn,X,'MarkerFaceColor','blue')
    
    subplot(3,1,3)
    stem(xn,impulso,'r','MarkerFaceColor','green')
    
    subplot(3,1,1);
    stem(xn,H,'MarkerFaceColor','blue')
    
    H= H([end 1:end-1]);
    pause(0.2)   
  end
  pause off
 