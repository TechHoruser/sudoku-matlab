function [SS]=solucion(S)
    cd('../Intel');
    SS=intel1(S);
    cd('../Funcs');
end