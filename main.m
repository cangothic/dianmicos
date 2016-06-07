
local = pwd;
direccion = strcat(local,'\diagramas de bode');
addpath(direccion)
direccion = strcat(local,'\herramientas');
addpath(direccion)
direccion = strcat(local,'\routh');
addpath(direccion)
direccion = strcat(local,'\zn1');
addpath(direccion)
direccion = strcat(local,'\zn2');
addpath(direccion)
direccion = strcat(local,'\estabilidad de un sistema discreto');
addpath(direccion)
direccion = strcat(local,'\jury');
addpath(direccion)
direccion = strcat(local,'\temas iniciales');
addpath(direccion)
while true
    display('ingrese 1 para categoria continuo')
    display('ingrese 2 para categoria discreto')
    display('ingrese 0 para salir')
    categoria = input('');
    switch categoria
        case 1
            display('presione 1 para ir al menu de bode')
            display('presione 2 para ir al menu de metodos ziegler nichols')
            display('presione 3 para ir al los metodos del lugar de las raices')
            categoria=input('');
            switch categoria
                case 1
                    display('presione 1 para hacer una grafica de bode')
                    display('presione 2 para criterio de estabilidad de bode')
                    display('presione 3 para calcular el pico y frecuencia de resonancia')
                    categoria=input('');

                    switch categoria
                        case 1
                            num = input('ingrese el numerador de la planta');
                            den = input('ingrese el denominador de la planta');
                            k = input('ingrese k');
                            planta = tf(num,den);
                            bodeGrafica(planta,k)
                            break
                        case 2
                            num = input('ingrese el numerador de la planta');
                            den = input('ingrese el denominador de la planta');
                            k = input('ingrese k');
                            planta = tf(num,den);
                            criterioBode(planta,k)
                            break
                        case 3
                            num = input('ingrese el numerador de la planta');
                            den = input('ingrese el denominador de la planta');
                            k = input('ingrese k');
                            planta = tf(num,den);
                            [picoDeResonancia,frecuenciaRezonancia] = picoYFrecuenciaDeResonancia(planta,k)
                            break
                    end

                    break
                case 2
                    display('ingrese 1 para el metodo de la tangente')
                    display('ingrese 2 para el metodo de oscilaciones sostenidas')
                    categoria=input('');
                    switch categoria
                        case 1
                            num = input('ingrese el numerador de la planta');
                            den = input('ingrese el denominador de la planta');
                            planta=tf(num,den);
                            zn1(planta)
                            break
                        case 2
                            num = input('ingrese el numerador de la planta');
                            den = input('ingrese el denominador de la planta');
                            planta=tf(num,den);
                            zn2(planta)
                            break
                    end
                    break
            end
            break
        case 2
            display('presione 1 para analizar la estabilidad de un sistema')
            display('presione 2 para analizar la etabilidad de un sistema por routh')
            display('presione 2 para analizar la etabilidad de un sistema por jury')
            categoria=input('');
            switch categoria
                case 1
                    num = input('ingrese el numerador de la planta en dominio continuo');
                    den = input('ingrese el denominador de la planta en dominio continuo');
                    planta = tf(num,den);
                    plantadiscreta = discretizar(planta)
                    estabilidaDiscreto(plantadiscreta)
                    break
                case 2
                    num = input('ingrese el numerador de la planta en dominio continuo');
                    den = input('ingrese el denominador de la planta dominio continuo');
                    planta = tf(num,den);
                    plantadiscreta = discretizar(planta)
                    routhdiscreto(plantadiscreta)
                    break
                case 3
                    num = input('ingrese el numerador de la planta en dominio continuo');
                    den = input('ingrese el denominador de la planta dominio continuo');
                    s = tf(num,den);
                    plantadiscreta = discretizar(planta)
                    metodoDeJury(plantadiscreta)
            end

            break
    end
    if categoria == 0
        break
    end
end
