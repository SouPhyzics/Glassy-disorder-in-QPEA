N = 40;
sd = normalized_sd;

r = prob_forder_m15;
x = prob_forder_m25;
y = prob_forder_m35;
z = prob_forder_m45;

for i = 3:N-2
   sdd(i) = sd(i);
   h(i) = (sd(i+2) - sd(i-2))./4;
   derr(i) = (r(i-2) - 8.*r(i-1) + 8.*r(i+1) - r(i+2))./(12*h(i));
   derx(i) = (x(i-2) - 8.*x(i-1) + 8.*x(i+1) - x(i+2))./(12*h(i));
   dery(i) = (y(i-2) - 8.*y(i-1) + 8.*y(i+1) - y(i+2))./(12*h(i));
   derz(i) = (z(i-2) - 8.*z(i-1) + 8.*z(i+1) - z(i+2))./(12*h(i));
end
sdd(sdd==0) = [];
derr(derr==0) = [];
derx(derx==0) = [];
dery(dery==0) = [];
derz(derz==0) = [];


scatter(sdd,derr,'*');
hold on;
scatter(sdd,derx,'rx');
scatter(sdd,dery,'k+');
scatter(sdd,derz,'m^');

legend('$m = 15$','$m = 25$','$m = 35$','$m = 45$','location','east','interpreter','latex');
xlabel('$\sigma$','interpreter','latex');
set(gca,'fontsize',15);
%ylabel('derivative of quenched averaged prob');
