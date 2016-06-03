function [kc, ki, kd] = zn2kckikd(Kcr, Tcr, TipoControlador)
    tabla = [];
    tabla(1,1) = 0.5*Kcr;
    tabla(2,1) = 0.45*Kcr;
    tabla(3,1) = 0.6*Kcr;
    tabla(2,2) = 1.2/Tcr;
    tabla(3,2) = 2/Tcr;
    tabla(3,3) = 0.125*Tcr;
    
    switch TipoControlador
        case 'P'
            kc=tabla(1,1);
            ki=0;
            kd=0;
        case 'PI'
            kc=tabla(2,1);
            ki=tabla(2,2);
            kd=0;
        case 'PID'
            kc=tabla(3,1);
            ki=tabla(3,2);
            kd=tabla(3,2);
    end
end

