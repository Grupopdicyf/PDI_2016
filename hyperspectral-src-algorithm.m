%   Implementación del
%   Algoritmo SRC para detección de borde
%   de lunares en Imágenes Hiperespectrales.
%   Cristian Martínez - Felipe Lamas.

%%  Entrenamiento.

clear all;
close all;
clc;

tic;

% Lectura de imagenes.
for q = 1:9
    if q == 1
        % Preasignacion de variable para velocidad en iteracion.
        img = cell(219,3);
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1207/
        for k = 18:236
            img{k-17,1} = imread(sprintf('lunar_1207_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1207(2)/
        for k = 18:236
            img{k-17,2} = imread(sprintf('lunar_1207(2)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1207(3)/
        for k = 18:236
            img{k-17,3} = imread(sprintf('lunar_1207(3)_CUBE_%d.PNG',k));
        end
        cd ..
    elseif q == 2
        % Preasignacion de variable para velocidad en iteracion.
        img = cell(219,3);
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1207(4)/
        for k = 18:236
            img{k-17,1} = imread(sprintf('lunar_1207(4)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1207(7)/
        for k = 18:236
            img{k-17,2} = imread(sprintf('lunar_1207(7)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1307(3)/
        for k = 18:236
            img{k-17,3} = imread(sprintf('lunar_1307(3)_CUBE_%d.PNG',k));
        end
        cd ..
    elseif q == 3
        % Preasignacion de variable para velocidad en iteracion.
        img = cell(219,3);
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1307(4)/
        for k = 18:236
            img{k-17,1} = imread(sprintf('lunar_1307(4)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1307(5)/
        for k = 18:236
            img{k-17,2} = imread(sprintf('lunar_1307(5)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1307(6)/
        for k = 18:236
            img{k-17,3} = imread(sprintf('lunar_1307(6)_CUBE_%d.PNG',k));
        end
        cd ..
    elseif q == 4
        % Preasignacion de variable para velocidad en iteracion.
        img = cell(219,3);
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(2)/
        for k = 18:236
            img{k-17,1} = imread(sprintf('lunar_1407(2)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(3)/
        for k = 18:236
            img{k-17,2} = imread(sprintf('lunar_1407(3)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(4)/
        for k = 18:236
            img{k-17,3} = imread(sprintf('lunar_1407(4)_CUBE_%d.PNG',k));
        end
        cd ..
    elseif q == 5
        % Preasignacion de variable para velocidad en iteracion.
        img = cell(219,3);
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(5)/
        for k = 18:236
            img{k-17,1} = imread(sprintf('lunar_1407(5)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(6)/
        for k = 18:236
            img{k-17,2} = imread(sprintf('lunar_1407(6)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(7)/
        for k = 18:236
            img{k-17,3} = imread(sprintf('lunar_1407(7)_CUBE_%d.PNG',k));
        end
        cd ..
    elseif q == 6
        % Preasignacion de variable para velocidad en iteracion.
        img = cell(219,3);
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(8)/
        for k = 18:236
            img{k-17,1} = imread(sprintf('lunar_1407(8)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(9)/
        for k = 18:236
            img{k-17,2} = imread(sprintf('lunar_1407(9)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(10)/
        for k = 18:236
            img{k-17,3} = imread(sprintf('lunar_1407(10)_CUBE_%d.PNG',k));
        end
        cd ..
    elseif q == 7
        % Preasignacion de variable para velocidad en iteracion.
        img = cell(219,3);
        
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(11)/
        for k = 18:236
            img{k-17,1} = imread(sprintf('lunar_1407(11)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(12)/
        for k = 18:236
            img{k-17,2} = imread(sprintf('lunar_1407(12)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(13)/
        for k = 18:236
            img{k-17,3} = imread(sprintf('lunar_1407(13)_CUBE_%d.PNG',k));
        end
        cd ..
    elseif q == 8
        % Preasignacion de variable para velocidad en iteracion.
        img = cell(219,3);
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(14)/
        for k = 18:236
            img{k-17,1} = imread(sprintf('lunar_1407(14)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(15)/
        for k = 18:236
            img{k-17,2} = imread(sprintf('lunar_1407(15)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(16)/
        for k = 18:236
            img{k-17,3} = imread(sprintf('lunar_1407(16)_CUBE_%d.PNG',k));
        end
        cd ..
    else
        % Preasignacion de variable para velocidad en iteracion.
        img = cell(219,1);
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(17)/
        for k = 18:236
            img{k-17,1} = imread(sprintf('lunar_1407(17)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(18)/
        for k = 18:236
            img{k-17,2} = imread(sprintf('lunar_1407(18)_CUBE_%d.PNG',k));
        end
        cd ..
        cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(19)/
        for k = 18:236
            img{k-17,3} = imread(sprintf('lunar_1407(19)_CUBE_%d.PNG',k));
        end
        cd ..
    end
    
    % Preasignacion de variable para velocidad en iteracion.
    columns = zeros(1,3);
    
    for p = 1:3
        [~, columns(1,p)] = size(img{1,p});
    end

    masklunar = cell(1,3);
    maskpiel = cell(1,3);
    
    % Eleccion de imagenes representativas para realizar mascara.
    bestimages = [192 72 22 162 131 10 194 162 22 202 197 72 197 131 6 122 82 132 40 192 158 2 152 12 78 12 209];

    % Caracterización de materiales (Lunar y Piel).
    if q == 1
        for p = 1:3
            masklunar{1,p} = roipoly(img{bestimages(p),p});
            maskpiel{1,p} = roipoly(img{bestimages(p),p});
            close all
        end
    elseif q == 2
        for p = 1:3
            masklunar{1,p} = roipoly(img{bestimages(p+3),p});
            maskpiel{1,p} = roipoly(img{bestimages(p+3),p});
            close all
        end
    elseif q == 3
        for p = 1:3
            masklunar{1,p} = roipoly(img{bestimages(p+6),p});
            maskpiel{1,p} = roipoly(img{bestimages(p+6),p});
            close all
        end
    elseif q == 4
        for p = 1:3
            masklunar{1,p} = roipoly(img{bestimages(p+9),p});
            maskpiel{1,p} = roipoly(img{bestimages(p+9),p});
            close all
        end
    elseif q == 5
        for p = 1:3
            masklunar{1,p} = roipoly(img{bestimages(p+12),p});
            maskpiel{1,p} = roipoly(img{bestimages(p+12),p});
            close all
        end
    elseif q == 6
        for p = 1:3
            masklunar{1,p} = roipoly(img{bestimages(p+15),p});
            maskpiel{1,p} = roipoly(img{bestimages(p+15),p});
            close all
        end
    elseif q == 7
        for p = 1:3
            masklunar{1,p} = roipoly(img{bestimages(p+18),p});
            maskpiel{1,p} = roipoly(img{bestimages(p+18),p});
            close all
        end
    elseif q == 8
        for p = 1:3
            masklunar{1,p} = roipoly(img{bestimages(p+21),p});
            maskpiel{1,p} = roipoly(img{bestimages(p+21),p});
            close all
        end
    else
        for p = 1:3
            masklunar{1,p} = roipoly(img{bestimages(p+24),p});
            maskpiel{1,p} = roipoly(img{bestimages(p+24),p});
            close all
        end
    end

    % Casting para manejo matematico de imagen en distintas bandas.
    for p = 1:3
        for k = 1:219
            img{k,p} = double(img{k,p});
        end
    end

    % Preasignacion de variables para velocidad en iteracion.
    imgslunar = cell(219,3);

    for p = 1:3
        for k = 1:219
            imgslunar{k,p} = masklunar{1,p}.*img{k,p};
        end
    end

    suma1 = zeros(219,3);
    count1 = zeros(1,3);

    for p = 1:3
        for k = 1:219
            for i = 1:320
                for j = 1:columns(1,p)
                    if(imgslunar{k,p}(i,j) ~= 0)
                        suma1(k,p) = suma1(k,p) + imgslunar{k,p}(i,j);
                        if k > 1
                            continue;
                        end
                        count1(1,p) = count1(1,p) + 1;
                    end
                end
            end
        end
    end

    % Preasignacion de variables para velocidad en iteracion.
    meanslunar = zeros(219,3);

    for p = 1:3
        for k = 1:219
            if(count1(1,p) == 0) % Si no existe pixel distinto de cero, entonces
                % promedio sera cero.
                meanslunar(k,p) = 0;
            else
                meanslunar(k,p) = suma1(k,p)/count1(1,p);
            end
        end
    end

    % Preasignacion de variables para velocidad en iteracion.
    imgspiel = cell(219,3);

    for p = 1:3
        for k = 1:219
            imgspiel{k,p} = maskpiel{1,p}.*img{k,p};
        end
    end

    suma2 = zeros(219,3);
    count2 = zeros(1,3);

    for p = 1:3
        for k = 1:219
            for i = 1:320
                for j = 1:columns(1,p)
                    if(imgspiel{k,p}(i,j) ~= 0)
                        suma2(k,p) = suma2(k,p) + imgspiel{k,p}(i,j);
                        if k > 1
                            continue;
                        end
                        count2(1,p) = count2(1,p) + 1;
                    end
                end
            end
        end
    end

    % Preasignacion de variables para velocidad en iteracion.
    meanspiel = zeros(219,3);

    for p = 1:3
        for k = 1:219
            if(count2(1,p) == 0) % Si no existe pixel distinto de cero, entonces
                % promedio sera cero.
                meanspiel(k,p) = 0;
            else
                meanspiel(k,p) = suma2(k,p)/count2(1,p);
            end
        end
    end

    % Preasignacion de variables para velocidad en iteracion.
    if q == 1
        rhor = zeros(27,47961);
    end
    
    % Vector patron que caracteriza ambos materiales mediante divisiones
    % de sus promedios de pixeles en cada banda.
    if q == 1
        for p = 1:3
            for n = 0:218
                for k = 1:219
                    rhor(p,n*219+k) = meanslunar(n+1,p)/meanspiel(k,p);
                end
            end
        end
    elseif q == 2
        for p = 1:3
            for n = 0:218
                for k = 1:219
                    rhor(p+3,n*219+k) = meanslunar(n+1,p)/meanspiel(k,p);
                end
            end
        end
    elseif q == 3
        for p = 1:3
            for n = 0:218
                for k = 1:219
                    rhor(p+6,n*219+k) = meanslunar(n+1,p)/meanspiel(k,p);
                end
            end
        end
    elseif q == 4
        for p = 1:3
            for n = 0:218
                for k = 1:219
                    rhor(p+9,n*219+k) = meanslunar(n+1,p)/meanspiel(k,p);
                end
            end
        end
    elseif q == 5
        for p = 1:3
            for n = 0:218
                for k = 1:219
                    rhor(p+12,n*219+k) = meanslunar(n+1,p)/meanspiel(k,p);
                end
            end
        end
    elseif q == 6
        for p = 1:3
            for n = 0:218
                for k = 1:219
                    rhor(p+15,n*219+k) = meanslunar(n+1,p)/meanspiel(k,p);
                end
            end
        end
    elseif q == 7
        for p = 1:3
            for n = 0:218
                for k = 1:219
                    rhor(p+18,n*219+k) = meanslunar(n+1,p)/meanspiel(k,p);
                end
            end
        end
    elseif q == 8
        for p = 1:3
            for n = 0:218
                for k = 1:219
                    rhor(p+21,n*219+k) = meanslunar(n+1,p)/meanspiel(k,p);
                end
            end
        end
    else
        for p = 1:3
            for n = 0:218
                for k = 1:219
                    rhor(p+24,n*219+k) = meanslunar(n+1,p)/meanspiel(k,p);
                end
            end
        end
    end
    
    % Limpiar memoria exceptuando el vector deseado.
    clearvars -except rhor;
    
end

rhor = mean(rhor);

toc;

%%  Deteccion de Borde.

tic;

% Preasignacion de variable para velocidad en iteracion.
img = cell(219,3);

% Lectura de imagen para deteccion de bordes de lunar.
cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(7)/
for k = 18:236
    img{k-17,1} = imread(sprintf('lunar_1407(7)_CUBE_%d.PNG',k));
end
cd ..

[~, column] = size(img{1,1});

% Casting para manejo matematico de imagen en distintas bandas.
for k = 1:219
    img{k,1} = double(img{k,1});
end

% Parametro de tolerancia (Se debe ajustar para lograr eficaz
% deteccion y minimizacion de ruido).
epsilon = 1.78;

% Preasignacion de variable para velocidad en iteracion.
Edges = zeros(320,column);

% Preasignacion de variable para velocidad en iteracion.
kappahoriz1 = zeros(1,47961);
kappahoriz2 = zeros(1,47961);
kappavert1 = zeros(1,47961);
kappavert2 = zeros(1,47961);
kappadiag11 = zeros(1,47961);
kappadiag12 = zeros(1,47961);
kappadiag21 = zeros(1,47961);
kappadiag22 = zeros(1,47961);

% Proceso de deteccion de borde de lunar mediante division
% de pixeles con mascara de 3x3.
for i = 2:319
    for j = 2:(column-1)
        
        for n = 0:218
            for k = 1:219
                kappahoriz1(1,n*219+k) = img{n+1,1}(i-1,j)/img{k,1}(i+1,j);
            end
        end
        
        for n = 0:218
            for k = 1:219
                kappahoriz2(1,n*219+k) = img{n+1,1}(i+1,j)/img{k,1}(i-1,j);
            end
        end
        
        x(1) = max(abs(kappahoriz1 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        x(2) = max(abs(kappahoriz2 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        
        for n = 0:218
            for k = 1:219
                kappavert1(1,n*219+k) = img{n+1,1}(i,j-1)/img{k,1}(i,j+1);
            end
        end
        
        for n = 0:218
            for k = 1:219
                kappavert2(1,n*219+k) = img{n+1,1}(i,j+1)/img{k,1}(i,j-1);
            end
        end
        
        x(3) = max(abs(kappavert1 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        x(4) = max(abs(kappavert2 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        
        for n = 0:218
            for k = 1:219
                kappadiag11(1,n*219+k) = img{n+1,1}(i-1,j-1)/img{k,1}(i+1,j+1);
            end
        end
        
        for n = 0:218
            for k = 1:219
                kappadiag12(1,n*219+k) = img{n+1,1}(i+1,j+1)/img{k,1}(i-1,j-1);
            end
        end
        
        x(5) = max(abs(kappadiag11 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        x(6) = max(abs(kappadiag12 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        
        for n = 0:218
            for k = 1:219
                kappadiag21(1,n*219+k) = img{n+1,1}(i-1,j+1)/img{k,1}(i+1,j-1);
            end
        end
        
        for n = 0:218
            for k = 1:219
                kappadiag22(1,n*219+k) = img{n+1,1}(i+1,j-1)/img{k,1}(i-1,j+1);
            end
        end
        
        x(7) = max(abs(kappadiag21 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        x(8) = max(abs(kappadiag22 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        
        % Llenado de matriz de borde.
        Edges(i,j) = any(x); % Si alguno de los elementos del vector logico
        % x es distinto de cero (borde) se asignará éste a la matriz de
        % borde Edges.
    end
end

figure(1)
imshow(Edges)

toc;

%% Ciclo for para visualizar bordes de lunar en imagen original.
for i = 1:320
    for j = 1:column
        if(Edges(i,j) ~= 0)
            img(i,j,1) = 255; % Con esto podremos visualizar
            % el borde con color rojo.
            img(i,j,2) = 0;
            img(i,j,3) = 0;
        end
    end
end

figure(2)
imshow(img)