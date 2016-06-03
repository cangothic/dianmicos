function [] = zn2graficaControladorP(Kcr, Tcr, planta)
    kc= zn2kckikd(Kcr, Tcr,'P');
    kps = tf(kc,[0 1]);
    GLc=cPLazoCerrado(kps, planta, 1);
    step(GLc)
end

