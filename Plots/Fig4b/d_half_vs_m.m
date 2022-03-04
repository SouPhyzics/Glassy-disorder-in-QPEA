%finds sd value at which prob gets prob/2
clear
clc

d = 0.23:0.005:1.33;
Nd = length(d);
sd = sqrt((2.*d.*sin(d) + 2.*cos(d) - d.*d.*cos(d) - 2)./(1-cos(d)));
m = 5:4:80;
Nm = length(m);
d_half = zeros(1,Nm);
sd_half = zeros(1,Nm);

for j = 1:Nm
    prob_all = altqavg_arbm(0,m(j),90000,1/2^(m(j)+1));
    for i = 1:Nd
        prob = altqavg_arbm(d(i),m(j),90000,1/2^(m(j)+1));
        if abs(prob - prob_all/2) < 0.003
            d_half(j) = d(i);
            sd_half(j) = sd(i);
            pos = i;
            break
        end
    end
    disp(sd_half);
    diff = ones(1,pos+5);
    for k = pos:pos+5
        prob = altqavg_arbm(d(k),m(j),90000,1/2^(m(j)+1));
        diff(k) = abs(prob - prob_all/2);
   end
    position = find(diff == min(diff));
    sd_half(j) = sd(position);
    disp(sd_half);
end

scatter(m,sd_half,'*');
xlabel('$m$','interpreter','latex');
%ylabel('$\sigma_{1/2}$','interpreter','latex');
set(gca,'fontsize',15);
