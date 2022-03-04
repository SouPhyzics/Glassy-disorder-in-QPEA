function vonMisesQuenchedProb = vonMisesqavg_arbm(delta,k,m,NN)

%k = kappa = 1/(sd)^2; m = auxiliary qubits; NN = number of points on sphere

r = 0;
s = 2*pi;
total = zeros(1,NN);

for i = 1:NN
    a = rand(1,m);
    phi = (s-r).*rand(1,m) + r;
    v = log(exp(k) - 2.*a.*sinh(k))./k;
    theta = acos(v);

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
    for ii = 1:m
        if xx(ii) < 0
            phinew(ii) = phinew(ii) + pi;
        end
    end
    probtot = 1;
    
    for j = 1:m
        probtot = probtot*( 1 + sin(thetanew(j)).*cos(phinew(j) + (2.^j).*pi.*delta))./2;
    end
    
    total(i) = probtot;
    
end

vonMisesQuenchedProb = sum(total)/NN;    %prob for NN points on the sphere

end

