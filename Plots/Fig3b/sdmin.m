%evaluate sd_min from I_min
clear
clc
iterations = 15;
I = zeros(1,iterations);
for k = 1:iterations
    [x,sd] = prob(50);         %N = 50 here
    sdd = zeros(1,50-2);       %N = 50 here
    derx = zeros(1,50-2);      %N = 50 here
    for i = 3:50-2             %N = 50 here
     sdd(i) = sd(i);
     h(i) = (sd(i+2) - sd(i-2))./4;
     derx(i) = (x(i-2) - 8.*x(i-1) + 8.*x(i+1) - x(i+2))./(12*h(i));
    end
    [M10,I10] = min(derx);
    I(k) = I10;
    disp(I)
end
I_min = median(I);
disp(I_min)
%sd_min = sdd(I_min);
I15 = I;
scatter([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15],I);