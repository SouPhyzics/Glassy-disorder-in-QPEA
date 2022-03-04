%Code for qavg prob vs disorder arbitrary (projection of ellipse on sphere)
%Checked convergence
clear
clc

m = 15;
area = 0.5;         %area < pi
N = 30;
delta = 1/2^20;
NN = 699999;

rmin = area/pi;
rmax = pi/area;
r = linspace(rmin,1,N);
qavg = zeros(2,N);
count = zeros(1,N);

for i = 1:N
    qavg(1,i) = ellip_working(r(i),area,m,NN,delta);
    disp(qavg(1,:));
end
ellip_m15_area05_low = qavg(1,:);
scatter(r, ellip_m15_area05_low,'*');
hold on;
%axis([rmin, rmax, 0, 1]);
%xlabel('$r$', 'interpreter', 'LaTeX');
%ylabel('qavg prob', 'interpreter', 'LaTeX');
%legend('$m = 15;  D = 0.5$','interpreter', 'LaTeX', 'location', 'northeast');
set(gca,'fontsize',15);
