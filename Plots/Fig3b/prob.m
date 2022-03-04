function [prob_m,sd] = prob(N)

m = 15;
delta = 1/2^20;
decimal = 0.0001;
d = linspace(0.15,0.65,N);
qavg = zeros(2,N);
standard_dev = zeros(1,N);
for i = 1:N
    NN = 799;
    for j = 1:50
        qavg(1,i) = altqavg_arbm(d(i),m,NN,delta);
        qavg(2,i) = altqavg_arbm(d(i),m,NN,delta);
        if abs(qavg(1,i) - qavg(2,i)) < decimal
            break
        end
        NN = NN*2;
    end
end
prob_m = qavg(1,:);
normalised_var = (2.*d.*sin(d) + 2.*cos(d) - d.*d.*cos(d) - 2)./(1-cos(d));
normalized_sd = sqrt(normalised_var);
sd = normalized_sd;
end