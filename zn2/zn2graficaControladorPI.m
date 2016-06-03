function [] = zn2graficaControladorPI(Kcr, Tcr, planta)
    [kc, ki]= zn2kckikd(Kcr, Tcr,'PI');
    numPI=[kc ki];
    denPI=[1 0];
    PI=tf(numPI,denPI);
    GLc=cPLazoCerrado(PI, planta, 1);
    step(GLc)
end

