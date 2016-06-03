function [estabilidad] = estabilidaDiscreto(Glcz)
    Polos = pole(Glcz);
    Mag = abs(Polos);
    if Mag<1
        estabilidad = true;
    else
        estabilidad = false;
    end
    pzmap(Glcz)
end

