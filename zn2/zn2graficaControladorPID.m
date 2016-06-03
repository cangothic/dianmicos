function [] = zn2graficaControladorPID(Kcr, Tcr, planta)
    [kc, ki, kd]= zn2kckikd(Kcr, Tcr,'PID');
    numPID=[kd kc ki];
    denPID=[1 0];
    PID=tf(numPID,denPID);
    GLc=cPLazoCerrado(PID, planta, 1);
    step(GLc)
end

