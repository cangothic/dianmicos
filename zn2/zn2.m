function [] = zn2( Gp )
    rlocus(Gp);
    [kcr,pole]=rlocfind(Gp);%kcr ganancia critica 
    wcr=max(imag(pole)); %frecuencia critica  se selecciona donde corta con el eje imaginario
    tcr=2*pi/wcr; %periodo critico
    
    disp('kcr es:')
    kcr
    disp('tcr es:')
    tcr
    figure
    Gplc=feedback(Gp,1);
    step(Gplc)
    title('planta')
    
    disp('Presiona cualquier tecla para graficar los controladores analogicos P, PI, PID')
    pause
    tabla = generarTablaZn2(kcr, tcr)
    
    figure    % Controlador P
    zn2graficaControladorP(kcr, tcr, Gp)
    title('CONTROLADOR P')
    grid
    
    figure    % Controlador PI
    zn2graficaControladorPI(kcr, tcr, Gp)
    title('CONTROLADOR PI')
    grid
   
    
    figure    % Controlador PID
    zn2graficaControladorPID(kcr, tcr, Gp)
    title('CONTROLADOR PID')
    grid
    
    figure    %Mostrar las graficas juntas
    %controlador P
    zn2graficaControladorP(kcr, tcr, Gp)
    hold on
    % Controlador PI
    zn2graficaControladorPI(kcr, tcr, Gp)
    hold on
    % Controlador PID
    zn2graficaControladorPID(kcr, tcr, Gp)
    hold on
    title('P ,PI PID')
    
end

