%Code for von Mises qavg vs numerical sd for arbitrary m
%Checked convergence

m = 25;
delta = 1/2^30;
N = 30;
decimal = 0.0002;
k = linspace(0.00001,10,N);
qavg = zeros(2,N);
count = zeros(1,N);
var = zeros(1,N);
standard_dev_right = zeros(1,N);
vonMises_m25_right = zeros(1,N);

for i = 1:N
    NN = 900;
    for j = 1:50
        qavg(1,i) = vonMisesqavg_arbm(delta,k(i),m,NN);
        qavg(2,i) = vonMisesqavg_arbm(delta,k(i),m,NN);
        if abs(qavg(1,i) - qavg(2,i)) < decimal
            break
        end
        NN = NN*2;
        count(i) = count(i) + 1;
    end
    disp(qavg(1,:))
end
for j = 1:N
    a = rand(1,599990);
    v = log(exp(k(j)) - 2.*a.*sinh(k(j)))./k(j);
    theta = acos(v);
    totalsq = 0;
    for i = 1:NN
        totalsq = totalsq + theta(i).^2;
    end
    var(j) = totalsq/NN;
    standard_dev_right(j) = sqrt(var(j));
end
vonMises_m25_right = qavg(1,:);
scatter(standard_dev_right, vonMises_m25_right,'*');
xlabel('$\sigma$', 'interpreter', 'latex');