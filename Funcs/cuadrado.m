function [a] = cuadrado(I,i,j)
    [alto,ancho] = size(I);
    constante=0.02;
    ancho=ancho-ancho*constante;
    alto=alto-alto*constante;
    R=[ round(j*alto/9+alto*constante),...
        round(i*ancho/9+ancho*constante),...
        round(alto/9-alto*constante),...
        round(ancho/9-ancho*constante)];
    a=imcrop(I,R);
end