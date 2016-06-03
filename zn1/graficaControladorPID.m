function [] = graficaControladorPID(T, L)
    s = tf('s');
    [kc, ki, kd]=kckikd(T,L,'PID');
    numPID=[kd kc ki];
    denPID=[1 0];
    PID=tf(numPID,denPID);
    Gp = exp(-L*s)/(T*s+1);
    GLc=cPLazoCerrado(PID, Gp, 1);
    step(GLc)
end

