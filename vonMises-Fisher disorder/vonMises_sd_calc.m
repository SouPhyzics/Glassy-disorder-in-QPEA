%numerically calculates the standard deviation of the distribution
clear
clc
NN = 59999;
k = linspace(10,0.0001,30);
var = zeros(1,30);
standard_dev = zeros(1,30);

for j = 1:30
    a = rand(1,NN);
    v = log(exp(k(j)) - 2.*a.*sinh(k(j)))./k(j);
    theta = acos(v);
    totalsq = 0;
    for i = 1:NN
        totalsq = totalsq + theta(i).^2;
    end
    var(j) = totalsq/NN;
    standard_dev(j) = sqrt(var(j));
end
scatter(k,standard_dev,'*');
set(gca,'fontsize',15);