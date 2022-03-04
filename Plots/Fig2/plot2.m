scatter(normalized_sd,prob_m1,'*')
hold on;
scatter(normalized_sd,prob_m5,'rx')
scatter(normalized_sd,prob_m15,'+k')
scatter(normalized_sd,prob_m25,'m^')
%scatter(normalized_sd,prob_m35,'m^')
%scatter(normalized_sd,prob_m45,'go')
scatter(normalized_sd,prob_m125,'go')
axis([0,1.72,0,1]);
xlabel('$d$','interpreter','latex');
set(gca,'fontsize',15);
legend('$m$ = 5','$m$ = 15', '$m$ = 25','$m$ = 35','$m$ = 125','interpreter','latex');