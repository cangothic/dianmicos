Dz=1;
K=10;
s=tf('s');
planta=200/(100*s*(0.5*s+1));
Hz=0.07;
plantaenz=discretizar(planta);
disp('la funcion de transferencia del sistema es')
sistema=cPLazoCerrado(Dz,plantaenz,Hz)
esEstable=estabilidaDiscreto(sistema);
if(esEstable)
    disp('el sistema es estable')
else
    disp('el sistema es inestable')
end