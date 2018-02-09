function ganador=comprobacion(imagen)
    ganador=1;
    for i=1:9
        mascara=obtener_mascara(i);
        
        [fm,cm]=size(mascara);
        [fi,ci]=size(imagen);
        
        imagen2=(imagen<150)+0;
        
        [~,mascara]=comprobar_vacio(mascara);
        [valor,imagen2]=comprobar_vacio(imagen2);
        
        if(valor~=0)
            imagen2=imresize(imagen2, [max([fm,fi]),max([cm,ci])]);
            mascara=imresize(mascara, [max([fm,fi]), max([cm,ci])]);
           
            mm=(min(min(mascara))+max(max(mascara)))/2;
            mascara=(mascara>mm)+0;
            mm=(min(min(imagen2))+max(max(imagen2)))/2;
            imagen2=(imagen2>mm)+0;
            
        %subplot(1,2,1)
        %imshow(imagen2)
        %subplot(1,2,2)
        %imshow(mascara)
        %pause
        %size(imagen2)
        %size(mascara)
            
            %Elegir uno
            nuevo=sum(sum(mascara==imagen2));
            %nuevo=xcorr2(imagen,mascara);
            
            if(i==1)
                parecido=nuevo;
            else
                if(parecido<nuevo)
                    parecido=nuevo;
                    ganador=i;
                end
            end
        else
            ganador=0;
        end
    end
end