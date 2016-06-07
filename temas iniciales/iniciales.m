clc
clear all
decision = input(' 1-> Para Diseño de sistemas mediante LGR (clase1) \n 2-> Diseño de un controlador PI por asignacion de polos para un sistema de primer orden \n 3-> Diseño de un controlador PID por asignacion de polos para un sistema de segundo orden');
switch decision
    case 1
        syms Tp Wn Z Mp ts T o W
        a = Tp-pi/(Wn*sqrt(1-Z^2));
        b = Tp - pi/W;
        c = Mp - exp((-Z*pi)/sqrt(1-Z^2));
        d = ts-4*T;
        e = ts-(4/o);
        f = 4/(Z*Wn);
        g = o^2+W^2-Wn^2;
        display('las variables validas son Tp,Wn,Z,Mp,ts,T,W')
        arreglo = input('ingrese arreglo de parametros con las variables validas ejemplo [T==1.25,Z==0.5] : ')

        solution = solve(a==0,b==0,c==0,d==0,e==0,g==0,arreglo,'IgnoreAnalyticConstraints', true)

        Tp = double(solution.Tp(1))
        Wn = double(solution.Wn(1))
        Z = double(solution.Z(1))
        Mp = (double(solution.Mp(1)))
        ts = (double(solution.ts(1)))
        T = double(solution.T(1))
        W = double(solution.W(1))
        o = double(solution.o(1))


        num = input('ingrese el numerador del sistema');
        den = input('ingrese el denominador del sistema');
        G = tf(num,den);
        r = rlocus(G);
        plot(r,'o')
        hold on
        k = 0:0.1:40;
        rlocus(G)
        axis([-4 0.1, -3 3]);
        plot([0 -3.5*Z],[0 3.5*sqrt(1-Z^2)],[0 -3.5*Z],[0 -3.5*sqrt(1-Z^2)])
        [K,poles] = rlocfind(num,den)
        [numLC,denLC] = cloop(K*num,den,-1);

        printsys(numLC,denLC)

        hold off

        step(numLC,denLC) %graficamos en el dominio del tiempo con escalon unitario

        %click derecho characteristics Peak response sube al sobre impulso
    case 2
        syms Tp Wn Z Mp ts T o W
        a = Tp-pi/(Wn*sqrt(1-Z^2));
        b = Tp - pi/W;
        c = Mp - exp((-Z*pi)/sqrt(1-Z^2));
        d = ts-4*T;
        e = ts-(4/o);
        f = 4/(Z*Wn);
        g = o^2+W^2-Wn^2;
        display('las variables validas son Tp,Wn,Z,Mp,ts,T,W')
        arreglo = input('ingrese arreglo de parametros con las variables validas ejemplo [ts==10,Z==0.6] : ')
        solution = solve(a==0,b==0,c==0,d==0,e==0,g==0,arreglo,'IgnoreAnalyticConstraints', true)
        Tp = double(solution.Tp(1))
        Wn = double(solution.Wn(1))
        Z = double(solution.Z(1))
        Mp = (double(solution.Mp(1)))
        ts = (double(solution.ts(1)))
        T = double(solution.T(1));
        W = double(solution.W(1))
        o = double(solution.o(1))

        numeradorPlanta = input('Ingrese el numerador de la planta')
        denominadorPlanta = input('Ingrese el denominador de la planta')
        K = numeradorPlanta
        T = denominadorPlanta(1)
        Kc = (2*Z*Wn*T-1)/K
        Ki = T*Wn^2 / K
        numeradorControlador = [Kc Ki];
        denominadorControlador = [1 0];
        Gp = tf(numeradorPlanta,denominadorPlanta);
        Gc = tf(numeradorControlador,denominadorControlador);
        G = series(Gp,Gc);
        G = feedback(G,1);
        step(G)
    case 3
        syms Tp Wn Z Mp ts T o W
        a = Tp-pi/(Wn*sqrt(1-Z^2));
        b = Tp - pi/W;
        c = Mp - exp((-Z*pi)/sqrt(1-Z^2));
        d = ts-4*T;
        e = ts-(4/o);
        f = 4/(Z*Wn);
        g = o^2+W^2-Wn^2;
        display('las variables validas son Tp,Wn,Z,Mp,ts,T,o,W')
        arreglo = input('ingrese arreglo de parametros con las variables validas ejemplo [ts==5,Z==0.7] : ')
        solution = solve(a==0,b==0,c==0,d==0,e==0,g==0,arreglo,'IgnoreAnalyticConstraints', true)
        Tp = double(solution.Tp(1))
        Wn = double(solution.Wn(1))
        Z = double(solution.Z(1))
        Mp = (double(solution.Mp(1)))
        ts = (double(solution.ts(1)))
        T = double(solution.T(1));
        W = double(solution.W(1))
        o = double(solution.o(1))
        numeradorPlanta = input('Ingrese el numerador de la planta')
        denominadorPlanta = input('Ingrese el denominador de la planta')
        A1 = numeradorPlanta
        A2 = denominadorPlanta(2)
        A3 = denominadorPlanta(3)
        A = 5*o+0.2
        Kd = (2*Z*Wn+A-A2)/A1
        Kc = (Wn^2+2*A*Z*Wn-A3)/A1
        Ki = (A*Wn^2)/A1
        numeradorControlador = [Kd Kc Ki];
        denominadorControlador = [1 0];
        Gp = tf(numeradorPlanta,denominadorPlanta);
        Gc = tf(numeradorControlador,denominadorControlador);
        G = series(Gp,Gc);
        G = feedback(G,1);
        step(G)
        
    case 4
        syms Tp Wn Z Mp ts T o W
        a = Tp-pi/(Wn*sqrt(1-Z^2));
        b = Tp - pi/W;
        c = Mp - exp((-Z*pi)/sqrt(1-Z^2));
        d = ts-4*T;
        e = ts-(4/o);
        f = 4/(Z*Wn);
        g = o^2+W^2-Wn^2;
        display('las variables validas son Tp,Wn,Z,Mp,ts,T,W')
        arreglo = input('ingrese arreglo de parametros con las variables validas ejemplo [Mp==0.05,ts==2.1] : ')
        solution = solve(a==0,b==0,c==0,d==0,e==0,g==0,arreglo,'IgnoreAnalyticConstraints', true)

        Tp = double(solution.Tp(1))
        Wn = double(solution.Wn(1))
        Z = double(solution.Z(1))
        Mp = (double(solution.Mp(1)))
        ts = (double(solution.ts(1)))
        T = double(solution.T(1))
        W = double(solution.W(1))
        o = -1*double(solution.o(1))


        solution = solve(a==0,b==0,c==0,d==0,e==0,g==0,arreglo,'IgnoreAnalyticConstraints', true)
        num = input('ingrese el numerador de la planta')
        den = input('ingrese el denominador de la planta')
        [ZEROS,POLOS] = tf2zpk(num,den);
        d1 = sqrt((POLOS(1)-o)^2+(W)^2)
        d2 = sqrt((POLOS(2)-o)^2+(W)^2)
        k = d1*d2
        
        Gp = tf(num,den);
        nc = k;
        dc = [0 1];
        Gc = tf(nc,dc);
        Gplc = feedback(Gp,1);
        t= 0:0.01:10;
        step(Gplc,t);
        hold on
        Gpc = series(Gp,Gc);
        Gpclc = feedback(Gpc,1);
        y = step(Gpclc,t);
        tam = size(y);
        error = 1 - y(tam(1))
        grid
        figure
        %poner el error
        display('PI por LGR, presione enter para continuar')
        pause()
        clc
        A = (-o)/6
        Gc = tf(k*[1 A],[1 0])
        Gplc = feedback(Gp,1);
        t= 0:0.01:10;
        step(Gplc,t);
        hold on
        Gpc = series(Gp,Gc);
        Gpclc = feedback(Gpc,1);
        y = step(Gpclc,t);
        tam = size(y);
        error = 1 - y(tam(1))
        grid
        figure
        %poner el error
        display('PD por LGR, presione enter para continuar')
        pause()
        clc
        %evaluar que el LGR no pasa por Pd
        angulosPolos = 0;
        i = 1;
        tam = size(ZEROS)
        while(i<=tam(1))
            angulo = atan(W/abs(o-POLOS(i)))
            angulo=angulo*180/pi
            if(o<ZEROS(i))
                angulosPolos = angulosPolos+(180-angulo);
            else
                angulosPolos = angulosPolos+angulo;
            end
            i = i+1;
        end
        angulosPolos = angulosPolos+180;
        angulosPolos = mod(angulosPolos,360);
        alfa = angulosPolos
        b = (W/tan(alfa))-o
        d0 = sqrt((b+o)^2+(W)^2)
        k = (d1*d2)/d0
        Gc = tf(k*[1 b],[1])
        Gplc = feedback(Gp,1);
        t= 0:0.01:10;
        step(Gplc,t);
        hold on
        Gpc = series(Gp,Gc);
        Gpclc = feedback(Gpc,1);
        y = step(Gpclc,t);
        tam = size(y);
        error = 1 - y(tam(1))
        grid
        figure
        
        %poner el error
        display('PID por LGR, presione enter para continuar')
        pause()
        clc
        a = abs(o/6);
        Gc = tf(k*conv([1 a],[1 b]),[1 0])
        Gplc = feedback(Gp,1);
        t= 0:0.01:10;
        step(Gplc,t);
        hold on
        Gpc = series(Gp,Gc);
        Gpclc = feedback(Gpc,1);
        y = step(Gpclc,t);
        tam = size(y);
        error = 1 - y(tam(1))
    
        grid
end
