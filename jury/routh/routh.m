function [] = routh(ecuacion_carateristica)
            longitud_de_la_ecuacion=length (ecuacion_carateristica);
            disp('Las raices de la ecuacion son:')
            roots(ecuacion_carateristica)
            if mod(longitud_de_la_ecuacion,2)==0 
                matrix=zeros(longitud_de_la_ecuacion,longitud_de_la_ecuacion/2);
                [filas,columnas]=size(matrix);
                for i=1:columnas
                    matrix(1,i)=ecuacion_carateristica(1,(2*i)-1);
                    matrix(2,i)=ecuacion_carateristica(1,(2*i));
                end
            else
                matrix=zeros(longitud_de_la_ecuacion,(longitud_de_la_ecuacion+1)/2);
                [filas,columnas]=size(matrix);
                for i=1:columnas
                    matrix(1,i)=ecuacion_carateristica(1,(2*i)-1);
                end
                for i=1:((longitud_de_la_ecuacion-1)/2)
                    matrix(2,i)=ecuacion_carateristica(1,(2*i));
                end
            end

            for j=3:filas
                if matrix(j-1,1)==0
                    matrix(j-1,1)=0.001;
                end
                for i=1:columnas-1
                    matrix(j,i)=(-1/matrix(j-1,1))*det([matrix(j-2,1) matrix(j-2,i+1);matrix(j-1,1) matrix(j-1,i+1)]);
                end
            end

            disp('El arreglo de Routh-Hurwitz es:'),matrix
            Temp=sign(matrix);a=0;
            for j=1:filas
                a=a+Temp(j,1);
            end
            if a==filas
                disp('El sistema es estable')
            else
                disp('El sistema es inestable')
end

