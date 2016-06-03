function [] = zn1(Gs)
    dt = 0.05;
    t = 0:dt:10;
    y = step(Gs,t);
    [L, T, K] = calcularLTK(t,y,dt);
    disp('EL valor de L es:');
    disp(L);
    disp('EL valor de T es:');
    disp(T);
    
    %Grafica con la tangente
    graficarCurvaDeReaccion(t, y, L, T)
    disp('EL valor de k es:');
    disp(K);
    disp('Presiona cualquier tecla para graficar los controladores analogicos P, PI, PID')
    pause
    tabla = generarTablaZn1(T,L)
    
    figure
    % Controlador P
    graficaControladorP(T,L)
    title('CONTROLADOR P')
    grid
    
    figure
    % Controlador PI
    graficaControladorPI(T,L)
    title('CONTROLADOR PI')
    grid
   
    
    figure
    % Controlador PID
    graficaControladorPID(T,L)
    title('CONTROLADOR PID')
    grid
    
    figure
    %Mostrar las graficas juntas
    %controlador P
    graficaControladorP(T,L)
    hold on
    % Controlador PI
    graficaControladorPI(T,L)
    hold on

    % Controlador PID
    graficaControladorPID(T,L)
    hold on

end

