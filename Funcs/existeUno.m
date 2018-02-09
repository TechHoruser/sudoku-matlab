function [a] = existeUno(I,c,r)
    a=0;
    [ancho, alto] = size(I);
    for i=-r:r
        for j=-r:r
            x=c(1)+i;
            y=c(2)+j;
            if(x>=1 && x<=ancho && y>=1 && y<=alto)
                if(I(x,y)==1)
                    a=a+1;
                end
            end
        end
    end
end