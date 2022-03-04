clear
clc
NumPoints = 6999999;
N = 60;
area = 0.5;
r = linspace(0.5/pi,pi/0.5,N);
var = zeros(1,N);
points_in_region = zeros(1,N);
standard_dev = zeros(1,N);

for j = 1:N
    b = sqrt(area./(pi.*r(j)));     %semi-axis along y
    a = b.*r(j);                   %semi-axis along x
    if a > b
        d = asin(a);
    else
        d = asin(b);
    end
    p = 1;
    q = cos(d);
    t = 0;
    s = 2*pi;
    ct = (p-q).*rand(1,NumPoints) + q;
    phi = (s-t).*rand(1,NumPoints) + t;
    theta = acos(ct);
    x = sin(theta).*cos(phi);
    y = sin(theta).*sin(phi);
    vartotal = 0;
    points = 0;
    for k = 1:NumPoints
        if (x(k)./a).^2 + (y(k)./b).^2 <= 1
            vartotal = vartotal + theta(k).^2;
            points = points + 1;
        end
    end
    var(j) = vartotal/points;
    points_in_region(j) = points;
    standard_dev(j) = sqrt(var(j));
    disp(standard_dev);
end
sd_elliptical_low = standard_dev;
scatter(r,sd_elliptical_low,'*');