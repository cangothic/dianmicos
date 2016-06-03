function [tabla] = GenerarTablaZn1(T,L)
    tabla = {'CONTROL' 'Kc' 'Ki' 'Kd';'P' T/L 0 0;'PI' 0.9*(T/L) 1/(3*L) 0;'PID' 1.2*(T/L) 1/(2*L) 0.5*L};
end

