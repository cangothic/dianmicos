function [] = graficaControladorP(T, L)
    s = tf('s');
    kc= kckikd(T,L,'P');
    kps = tf(kc,[0 1]);
    Gp = exp(-L*s)/(T*s+1);
    GLc=cPLazoCerrado(kps, Gp, 1);
    step(GLc)
end

