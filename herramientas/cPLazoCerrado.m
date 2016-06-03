function [retroalimentacion] = cPLazoCerrado( controlador,planta,H)
    lazoAbierto = series(controlador, planta);
    retroalimentacion = feedback(lazoAbierto,1); 
end

