function x = pasa (M,i,j,num)
    if (~isempty(find(M(i,:)==num)) || ~isempty(find(M(:,j)==num)))
        x=0;
    else
        a=floor((i-1)/3);
        
        b=floor((j-1)/3);
        
        N=M(a*3+1:(a+1)*3,b*3+1:(b+1)*3);
        
        if (~isempty(find(N(:,:)==num)))
            x=0;
        else
            x=1;
        end
    end
end