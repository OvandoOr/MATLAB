
close all
clc
clear all

h=[1 1 1 1 1 1 1 1 1];
N=length(h);
hHist2=hist(h,N);

for i=1:N
    if hHist2(i)==0
        hHist2(i)=1;
    end
    
end

Entropy =  log2(N) - sum(hHist2.*log2(hHist2))/N;