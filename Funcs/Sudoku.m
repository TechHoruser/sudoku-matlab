function [S] = Sudoku(W)
Cuadrado=0;

% Primer reconocedor (Cuadrado del Sudoku)
while (~Cuadrado)
    img=snapshot(W);
    %Visualización
    %subplot(1,2,1)
    imshow(fliplr(img)); hold on,
    R1 = [121 41 399 399];
    rectangle('Position', [R1(1),R1(2),R1(3),R1(4)],...
    'EdgeColor','r','LineWidth',2);
    R2 = [166 86 309 309];
    rectangle('Position', [R2(1),R2(2),R2(3),R2(4)],...
    'EdgeColor','b','LineWidth',2);
    
    % Preprocesado
    % Recortado
    I=imcrop(img,R1);
    
    % A escala de grises
    IA = rgb2gray(I);

    % Filtro
    h= fspecial('unsharp');
    IA=imfilter(IA,h);

    % Realzado
    %h=fspecial('unsharp');
    %IR=uint8(conv2(double(IA),h));
    %IA=imcrop(IR,[2,2,399,399]);
    
    % Detección de Bordes
    IB = edge(IA, 'prewitt');
    
    [b, R3] = encontrarCuadrado(IB,R1);
    
    if(b)
        Cuadrado=1;
        %tittle('CAPTURADO');
    end
end

I=imcrop(imcrop(IA,[45 45 309 309]),R3);

%close all
%imshow(I)

% Segundo reconocedor (Cifras del sudoku)

%se = strel('square',1);
%IE = imerode(IU,se);
%imshow(I)

% Creación de Sudoku
for i=1:9
    for j=1:9
        c = cuadrado(I,i-1,j-1);
        S(i,j)=comprobacion(c);
    end
end
hold off;
imshow(pintar_sudoku(S))


%pintar_sudoku(solucion(S));

