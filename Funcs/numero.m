function N=numero(M,x,y)
%   N estará vacia si su tamaño es menor de 9 pixels.
    CC = bwconncomp(M,4);
    E = labelmatrix(CC);
    
    [f,c] = find(E==E(x(1),y(1)));
    fmin=min(f);
    cmin=min(c);
    fmax=max(f);
    cmax=max(c);
    for i=fmin:fmax
        for j=cmin:cmax
            N(i-fmin+1,j-cmin+1)=M(i,j);
        end
    end
    
    %Punto de ruido
    [x1,y1]=size(N);
    if(x1*y1<9)
        N=[];
    end
end
