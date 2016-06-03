function [ tabla ] = generarTablaZn2(Kcr,Tcr)
    tabla={'CONTROL' 'Kc' 'Ki' 'Kd';'P' 0.5*Kcr 0 0;'PI' 0.45*Kcr 1.2/Tcr 0;'PID' 0.6*Kcr 2/Tcr 0.125*Tcr};
end

