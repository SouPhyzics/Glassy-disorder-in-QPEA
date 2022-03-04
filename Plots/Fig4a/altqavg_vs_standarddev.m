%Code for quenched averaged probability vs normalized sd for arbitrary m
%Checked convergence
clear
clc

m = 1;
delta = 1/2^10;
N = 50;
decimal = 0.0002;

d = linspace(0,pi,N);
qavg = zeros(2,N);
count = zeros(1,N);
standard_dev = zeros(1,N);

for i = 1:N
    NN = 299;
    for j = 1:50
        qavg(1,i) = altqavg_arbm(d(i),m,NN,delta);
        qavg(2,i) = altqavg_arbm(d(i),m,NN,delta);
        if abs(qavg(1,i) - qavg(2,i)) < decimal
            break
        end
        NN = NN*2;
        count(i) = count(i) + 1;
    end
end
prob_m1 = qavg(1,:);
normalised_var = (2.*d.*sin(d) + 2.*cos(d) - d.*d.*cos(d) - 2)./(1-cos(d));
normalized_sd = sqrt(normalised_var);
scatter(normalized_sd, prob_m1,'*');
xlabel('$\sigma$','interpreter','latex');