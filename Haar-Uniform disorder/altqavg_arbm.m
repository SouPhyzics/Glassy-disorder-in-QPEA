function quenchedprob = altqavg_arbm(d,m,NN,delta)

%d = disorder strength; m = auxiliary qubits; NN = number of points on sphere

a = 0;
b = d;
p = cos(a);
q = cos(b);
r = 0;
s = 2*pi;
total = zeros(1,NN);
    
for i = 1:NN
    ct = (p-q).*rand(1,m) + q;
    phi = (s-r).*rand(1,m) + r;
    theta = acos(ct);
    x = sin(theta).*cos(phi);
    y = sin(theta).*sin(phi);
    z = cos(theta);
    A = [0 0 1; 0 1 0; -1 0 0];
    vec = [x; y; z];
    vecnew = A*vec;
    xx = vecnew(1,:);
    yy = vecnew(2,:);
    zz = vecnew(3,:);
    thetanew = acos(zz);
    phinew = atan(yy./xx);
    for k = 1:m
        if xx(k) < 0
            phinew(k) = phinew(k) + pi;
        end
    end
    probtot = 1;
    
    for j = 1:m
        probtot = probtot*(1 + sin(thetanew(j)).*cos(phinew(j) + (2.^j).*pi.*delta))./2;
    end
    total(i) = probtot;
    
end

quenchedprob = sum(total)/NN;    %prob for NN points on the sphere

end
