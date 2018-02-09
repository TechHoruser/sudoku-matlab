function [SF] = modificar(S,v,I)
SF=S;
[x,y]=ginput(1);

[alto,ancho] = size(I);
constante=5;
ancho=ancho-constante;
alto=alto-constante;

pos=[];
for i=0:8
    for j=0:8
        R=[ round(j*alto/9+constante),...
            round(i*ancho/9+constante),...
            round(alto/9-constante),...
            round(ancho/9-constante)];
        if (x>R(1) && x<R(1)+R(3) && y>R(2) && y<R(2)+R(4))
            pos=[i+1,j+1];
        end
    end
end

if(~isempty(pos))
    SF(pos(1),pos(2))=v;
end

