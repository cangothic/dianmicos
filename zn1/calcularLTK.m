function [L, T, K] = calcularLTK(t, y, dt)
    dy = diff(y)/dt; % derivacion
    [m,p] = max(dy);%saca la pendiente m y la ubicacion donde se encuentran los puntos de inflexion en los arreglos y y t
    yi = y(p);%cordenada y del punto de inflexion 
    ti = t(p);%cordena x del punto de inflexion
    L = ti-yi/m; %m=(yi-0)/(xi-L) deoejando L de esta formula se haya el valor L 
    K = y(end);%valor final
    T = K/m; %m=k/T
end

