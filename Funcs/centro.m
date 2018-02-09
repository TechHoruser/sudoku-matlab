function [x,y] = centro(I)
%   Si devuelve x e y = 0, implica que noha encontrado ningun punto
%   centrado.
    [f,c]=size(I);
    f=round(f/2);
    c=round(c/2);
    
    i=0;
    encontrado=0;
    margen=7;
    while (i<=margen && ~encontrado)
        for j=f-i:f+i
            for k=c-i:c+i
                M(j-(f-i)+1,k-(c-i)+1)=I(j,k);
            end
        end
        
        [x,y]=find(M==1);
        
        if (~isempty(x))
            encontrado=1;
            [t,~]=size(M);
            x=f-round(t/2)+x;
            y=c-round(t/2)+y;
        end
        
        i=i+1;
    end
    if(~encontrado)
        x=0;
        y=0;
    end
end
        