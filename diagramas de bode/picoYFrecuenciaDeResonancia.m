function [ picoResonante, FrecuenciaResonancia] = picoYFrecuenciaDeResonancia(planta,k)
    planta = planta*k;
    w = logspace(-2,2); 
    bode(planta,w)    
    [mag,phase,w] = bode(h,w);
    [Mp,k] = max(mag);
    picoResonante = Mp;
    FrecuenciaResonancia = w(k);
end

