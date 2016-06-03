function [Gm, Pm, Wcg,Wcp,estabilidad] = criterioBode(planta,k)
    planta=planta*k;
    [Gm,Pm,Wcg,Wcp] = margin (planta);
    Gm=20*log10(Gm);
    if(Gm>0 && Pm>0)
        estabilidad = true;
    else
        estabilidad = false;
    end
end

