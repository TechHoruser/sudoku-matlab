function M = intel1 (N)
    M=N;
    fin=length(find(M(:,:)~=0));
    cont=0;
    while (fin<=81 & cont==0) 
        cont=[];
        for num=1:9
            for i=1 : 9
                %Comprobamos si ese numero ya existe en esa fila.
                v=[];
                tam=0;
                if (isempty(find(M(i,:)==num)))
                    for j=1:9
                        if(M(i,j)==0 && pasa(M,i,j,num))
                            v(tam+1)=j;
                            tam=tam+1;
                        end
                    end
                    if(tam==1)
                        M(i,v(1))=num;
                    end
                end
                
                %Comprobamos si ese numero ya existe en esa columna.
                v=[];
                tam=0;
                if (isempty(find(M(:,i)==num)))
                    for j=1:9
                        if(M(j,i)==0 && pasa(M,j,i,num))
                            v(tam+1)=j;
                            tam=tam+1;
                        end
                    end
                    if(tam==1)
                        M(v(1),i)=num;
                    end
                end
            end
            
            %Comprobamos si ese numero ya existe en ese cuadrado.
            for a=0:2
                for b=0:2
                    A=M(3*a+1:3*(a+1),3*b+1:3*(b+1));
                    v=[];
                    tam=0;
                    
                    if (isempty(find(A==num)))
                        for i=1:3
                            for j=1:3
                                if(A(i,j)==0 && pasa(M,a*3+i,b*3+j,num))
                                    v=[v; i,j];
                                    tam=tam+1;
                                end
                            end
                        end
                        if(tam==1)
                            M(a*3+v(1,1),b*3+v(1,2))=num;
                        end
                    end
                end
            end
            fin=length(find(M(:,:)~=0));

            %Si la matriz no ha cambiado con este método no se vuelve a
            %repetir.
            c=M(:,:)==N(:,:);
            if (isempty(find(c==0)))
            	cont(num)=1;
            else
                cont(num)=0;
                N=M;
            end
        end
        if(isempty(find(cont==0)))
            cont=1;
        else
            cont=0;
        end
    end
end