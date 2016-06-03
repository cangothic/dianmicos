function [Gz] = discretizar(Planta)
    disp('Ingrese el tiempo de muestreo')
    T = input ('');
    disp ('La funcion discreta de la planta : G(z) =');
    disp('');
    Gz = c2d (Planta,T,'zoh');
end

