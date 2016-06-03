function [] = bodeGrafica(planta,k)
    planta=planta*k;
    bode(planta)
end

