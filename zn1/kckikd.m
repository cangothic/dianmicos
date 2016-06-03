function [kc,ki,kd] = kckikd(T,L,TipoControlador)
    tabla=[];
    tabla(1,1)=T/L;
    tabla(2,1)=0.9*T/L;
    tabla(3,1)=1.2*T/L;
    tabla(2,2)=L/0.3;
    tabla(3,2)=2*L;
    tabla(3,3)=0.5*L;
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

