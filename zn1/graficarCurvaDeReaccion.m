function [] = graficarCurvaDeReaccion(t, y, L, T)
    plot(t,y,'b',[0 L L+T t(end)],[0 0 y(end) y(end)], 'k');
    grid
    title('M�todo de Curva de Reacci�n')
end

