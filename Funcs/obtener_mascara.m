function mascara=obtener_mascara(num)
    cd('../Mascs');
    nombre=strcat(num2str(num),'.png');
    mascara=imread(nombre);
    mascara=(rgb2gray(mascara)<128)+0;
    cd('../Funcs');
end