function [valor,imagen]= comprobar_vacio(imagen)
    [x,y]=centro(imagen);
    if(x(1)==0 || isempty(numero(imagen,x,y)))
        valor=0;
        imagen=[];
    else
        valor=1;
        imagen=numero(imagen,x,y);
    end
end