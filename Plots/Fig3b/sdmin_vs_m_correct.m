m = linspace(10,80,15);
I_min = zeros(1,15);
I_min(1) = median(I10);
I_min(2) = median(I15);
I_min(3) = median(I20);
I_min(4) = median(I25);
I_min(5) = median(I30);
I_min(6) = median(I35);
I_min(7) = median(I40);
I_min(8) = 16;
I_min(9) = median(I50);
I_min(10) = median(I55); 
I_min(11) = median(I60);
I_min(12) = median(I65);
I_min(13) = median(I70);
I_min(14) = median(I75);
I_min(15) = median(I80);
for i = 1:15
    sd_min(i) = sdd(I_min(i));
end
mm = linspace(10,80,200);
fit = 1.178.*mm.^(-0.2817) - 0.19;
scatter(m,sd_min,'b*');
hold on;
plot(mm,fit,'linewidth',1.3);
set(gca,'fontsize',15);
xlabel('$m$','interpreter','latex');
legend('','$\sigma_c = 1.18m^{-0.28}-0.19$','interpreter','latex');