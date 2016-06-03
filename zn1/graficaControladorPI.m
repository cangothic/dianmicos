function [] = graficaControladorPI(T, L)
    s = tf('s');
    [kc, ki]=kckikd(T,L,'PI');
    numPI=[kc ki];
    denPI=[1 0];
    PI=tf(numPI,denPI);
    Gp = exp(-L*s)/(T*s+1);
    GLc=cPLazoCerrado(PI, Gp, 1);
    step(GLc)
end

