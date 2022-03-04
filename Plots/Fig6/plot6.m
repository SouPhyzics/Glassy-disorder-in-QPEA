scatter(normalized_sd,prob_m1,'b*','linewidth',0.7)
hold on
scatter(normalized_sd,prob_m5,'rx','linewidth',0.7)
scatter(normalized_sd,prob_m15,'k+','linewidth',0.7)
scatter(normalized_sd,prob_m25,'m^','linewidth',0.7)

plot(vonMises_sd,vonMises_m1,'r-.','linewidth',1)
plot(vonMises_sd,vonMises_m5,'b-.','linewidth',1)
plot(vonMises_sd,vonMises_m15,'g-.','linewidth',1)
plot(vonMises_sd,vonMises_m25,'c-.','linewidth',1)

set(gca,'fontsize',15)
axis([0,1.75,0,1])
lgn = legend('$m = 1$','$m = 5$','$m = 15$','$m = 25$','$m = 1$','$m = 5$','$m = 15$','$m = 25$','interpreter','latex','location','southoutside');
lgn.NumColumns = 2;
title(lgn, 'Haar-uniform; Spherical normal')