function [I]=pintar_sudoku(S)
    cd('../Imgs');
    I=zeros((54-5)*9+5);
    for i=1:9
        for j=1:9
            nombre=strcat(num2str(S(i,j)),'.png');
            im=imread(nombre);
            if(i~=1)
                if(j~=1)
                    a=(i-1)*(54-5);
                    b=(j-1)*(54-5);
                    %set(var,'YData',(i-1)*(54-5),'XData',(j-1)*(54-5));
                else
                    a=(i-1)*(54-5);
                    b=0;
                    %set(var,'YData',(i-1)*(54-5),'XData',0);
                end
            else
                if(j~=1)
                    a=0;
                    b=(j-1)*(54-5);
                    %set(var,'YData',0,'XData',(j-1)*(54-5));
                else
                    a=0;
                    b=0;
                    %set(var,'YData',0,'XData',0);
                end
            end
            a=a+1;
            b=b+1;
            for k1=a:a+53
                for k2=b:b+53
                    I(k1,k2)=im(k1-a+1,k2-b+1);
                end
            end
        end
    end
    cd('../Funcs');
end