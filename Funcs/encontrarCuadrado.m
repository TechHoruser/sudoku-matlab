function [b, R3] = encontrarCuadrado(I,R1)
    b=0;
    R3=[0 0 0 0];
    % Creamos una imagen que solo contenga los bordes entre los dos
    % cuadrados.
    tam1 = R1(end)+1;
    IR = zeros(tam1);
    for i=1:tam1
        for j=1:tam1
            if (i<46 || i>355 || j<46 || j>355)
                IR(i,j) = I(i,j);
            end
        end
    end
    
    % Comprobamos que no haya nada entre los dos cuadrados
    b1=0;
    for i=6:395
        for j=6:395
            if(IR(i,j)==1)
            	b1 = b1+1;
            end
        end
    end
    
    % Mediante ensayo hemos observado que un valor optimo de b1 es menor
    % a 75
    % subplot(1,3,2)
    % imshow(I)
    % subplot(1,3,3)
    % imshow(IR)
    %b1
    
    if (b1<75) % Ha pasado el primer test, ahora comprobaremos si es un cuadrado
        Iaux=zeros(400);
        for i=1:310
            for j=1:310
                Iaux(i+45,j+45)=I(i+45,j+45);
            end
        end
        se = strel('square',40);
        ID = imdilate(Iaux,se);
        IE = imerode(ID,se);
        R2 = [45 45 309 309];
        %subplot(1,3,2)
        %imshow(fliplr(ID))
        %subplot(1,2,2)
        IU = imcrop(IE,R2);
        %imshow(IU)
        
        % Vemos cuantos blancos tiene el cuadrado interno
        IF = imcrop(IE,R2);
        blancos = sum(sum(IF));
        por1 = 75;
        %blancos
        if(blancos > por1*(R2(end)+1)^2/100) % Gran parte de la imagen del cuadrado interno contiene blanco, concretamente el 75%
            [f,c]=find(IF==1);
            %Primera fila con 1
            f1=min(f);
            %Última fila con 1
            f2=max(f);
            %Primera columna con 1
            c1=min(c);
            %Última columna con 1
            c2=max(c);
            R3 = [c1 f1 c2-c1 f2-f1];
            
            %Esta sección pude ser modificada para decirte si el cuadrado
            %está bien centrado, en vez del area comparativa de las
            %filas y columnas.
            
            
            cuadrado=[f1 f2 f1 f2;...
                      c1 c1 c2 c2]';
            
            cnt = 0; %Contador de numero de unos que existen en las esquinas del cuadrado creado.
            rangoEncuadre = 4;
            for i=1:4
                if(existeUno(IF,cuadrado(i,:),rangoEncuadre))
                      cnt = cnt+1;
                end
            end
            if (cnt==4)
                b=1;
                %close all
            end
            %rectangle('Position', [R3(1),R3(2),R3(3),R3(4)],...
            %'EdgeColor','y','LineWidth',2);
            
            
            % Ahora si en ese subcuadrado hay mas del 95% de los puntos
            % diremos que hemos encontrado un sudoku "centrado"
            %-por2 = 95;
            II = imcrop(IU,R3);
            %-blancos = sum(sum(II));
            %blancos
            %maximo = por2*(R3(3)+1)*(R3(4)+1)/100
            %diferencia = maximo - blancos
            %figure, imshow(II)
            %-if (blancos > por2*(R3(3)+1)*(R3(4)+1)/100)
            %-    b=1;
            %-end
            %pause(5)
        end
    end
end