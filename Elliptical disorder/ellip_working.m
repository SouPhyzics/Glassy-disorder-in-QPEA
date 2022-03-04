function ellipquenchedprob = ellip_working(r,area,m,NN,delta)

b = sqrt(area/(pi*r));     %semi-axis along z
a = b*r;                   %semi-axis along y

if a > b
    d = asin(a);
else
    d = asin(b);
end

p = 1;
q = cos(d);
r = 0;
s = 2*pi;
sum1 = 0;

for i = 1:NN
    probtot = 1;
    j = 1;
    while (j < (m+1))
        ct = (p-q).*rand() + q;
        phi = (s-r).*rand() + r;
        theta = acos(ct);
        x = sin(theta).*cos(phi);
        y = sin(theta).*sin(phi);
        z = cos(theta);
        xx = z;
        yy = y;
        zz = -x;
        thetanew = acos(zz);
        phinew = atan(yy./xx);
        if (yy/a)^2 + (zz/b)^2 <= 1
            probtot = probtot*(1 + sin(thetanew).*cos(phinew + (2.^j).*pi.*delta))./2;
            j = j + 1;
        end
    end
    sum1 = sum1 + probtot;
end

ellipquenchedprob = sum1/NN;    %prob for NN points on the sphere
