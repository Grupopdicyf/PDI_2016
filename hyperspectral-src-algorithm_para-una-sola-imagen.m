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

% Preasignacion de variable para velocidad en iteracion.
img = cell(50,1);
cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(15)/
for k = 190:239
    img{k-189,1} = imread(sprintf('lunar_1407(15)_CUBE_%d.PNG',k));
end
cd ..

% Preasignacion de variable para velocidad en iteracion.

[~, column] = size(img{1,1});

masklunar = cell(1,1);
maskpiel = cell(1,1);

% Caracterización de materiales (Lunar y Piel).
masklunar{1,1} = roipoly(img{25,1});
maskpiel{1,1} = roipoly(img{25,1});
close all

% Casting para manejo matematico de imagen en distintas bandas.
for k = 1:50
    img{k,1} = double(img{k,1});
end

% Preasignacion de variables para velocidad en iteracion.
imgslunar = cell(50,3);

for k = 1:50
    imgslunar{k,1} = masklunar{1,1}.*img{k,1};
end

suma1 = zeros(50,1);
count1 = 0;

for k = 1:50
    for i = 1:320
        for j = 1:column
            if(imgslunar{k,1}(i,j) ~= 0)
                suma1(k,1) = suma1(k,1) + imgslunar{k,1}(i,j);
                if k > 1
                    continue;
                end
                count1 = count1 + 1;
            end
        end
    end
end

% Preasignacion de variables para velocidad en iteracion.
meanslunar = zeros(50,1);

for k = 1:50
    if(count1 == 0) % Si no existe pixel distinto de cero, entonces
        % promedio sera cero.
        meanslunar(k,1) = 0;
    else
        meanslunar(k,1) = suma1(k,1)/count1;
    end
end

% Preasignacion de variables para velocidad en iteracion.
imgspiel = cell(50,1);

for k = 1:50
    imgspiel{k,1} = maskpiel{1,1}.*img{k,1};
end

suma2 = zeros(50,1);
count2 = 0;

for k = 1:50
    for i = 1:320
        for j = 1:column
            if(imgspiel{k,1}(i,j) ~= 0)
                suma2(k,1) = suma2(k,1) + imgspiel{k,1}(i,j);
                if k > 1
                    continue;
                end
                count2 = count2 + 1;
            end
        end
    end
end

% Preasignacion de variables para velocidad en iteracion.
meanspiel = zeros(50,1);

for k = 1:50
    if(count2 == 0) % Si no existe pixel distinto de cero, entonces
        % promedio sera cero.
        meanspiel(k,1) = 0;
    else
        meanspiel(k,1) = suma2(k,1)/count2;
    end
end

% Preasignacion de variables para velocidad en iteracion.
rhor = zeros(1,2500);

% Vector patron que caracteriza ambos materiales mediante divisiones
% de sus promedios de pixeles en cada banda.
for n = 0:49
    for k = 1:50
        rhor(1,n*50+k) = meanslunar(n+1,1)/meanspiel(k,1);
    end
end

% Limpiar memoria exceptuando el vector deseado.
clearvars -except rhor;

toc;

%%  Deteccion de Borde.

tic;

% Preasignacion de variable para velocidad en iteracion.
img = cell(50,1);

% Lectura de imagen para deteccion de bordes de lunar.
cd ~/Documentos/MATLAB_Files/ProyectoFinal-PDI_Lamas-Martinez/lunar_1407(15)/
for k = 190:239
    img{k-189,1} = imread(sprintf('lunar_1407(15)_CUBE_%d.PNG',k));
end
cd ..

[~, column] = size(img{1,1});

% Casting para manejo matematico de imagen en distintas bandas.
for k = 1:50
    img{k,1} = double(img{k,1});
end

% Parametro de tolerancia (Se debe ajustar para lograr eficaz
% deteccion y minimizacion de ruido).
epsilon = 1.0;

% Preasignacion de variable para velocidad en iteracion.
Edges = zeros(320,column);

% Preasignacion de variable para velocidad en iteracion.
kappahoriz1 = zeros(1,2500);
kappahoriz2 = zeros(1,2500);
kappavert1 = zeros(1,2500);
kappavert2 = zeros(1,2500);
kappadiag11 = zeros(1,2500);
kappadiag12 = zeros(1,2500);
kappadiag21 = zeros(1,2500);
kappadiag22 = zeros(1,2500);

% Proceso de deteccion de borde de lunar mediante division
% de pixeles con mascara de 3x3.
for i = 2:319
    for j = 2:(column-1)
        for n = 0:49
            for k = 1:50
                kappahoriz1(1,n*50+k) = img{n+1,1}(i-1,j)/img{k,1}(i+1,j);
            end
        end
        
        for n = 0:49
            for k = 1:50
                kappahoriz2(1,n*50+k) = img{n+1,1}(i+1,j)/img{k,1}(i-1,j);
            end
        end
        
        x(1) = max(abs(kappahoriz1 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        x(2) = max(abs(kappahoriz2 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        
        for n = 0:49
            for k = 1:50
                kappavert1(1,n*50+k) = img{n+1,1}(i,j-1)/img{k,1}(i,j+1);
            end
        end
        
        for n = 0:49
            for k = 1:50
                kappavert2(1,n*50+k) = img{n+1,1}(i,j+1)/img{k,1}(i,j-1);
            end
        end
        
        x(3) = max(abs(kappavert1 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        x(4) = max(abs(kappavert2 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        
        for n = 0:49
            for k = 1:50
                kappadiag11(1,n*50+k) = img{n+1,1}(i-1,j-1)/img{k,1}(i+1,j+1);
            end
        end
        
        for n = 0:49
            for k = 1:50
                kappadiag12(1,n*50+k) = img{n+1,1}(i+1,j+1)/img{k,1}(i-1,j-1);
            end
        end
        
        x(5) = max(abs(kappadiag11 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        x(6) = max(abs(kappadiag12 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        
        for n = 0:49
            for k = 1:50
                kappadiag21(1,n*50+k) = img{n+1,1}(i-1,j+1)/img{k,1}(i+1,j-1);
            end
        end
        
        for n = 0:49
            for k = 1:50
                kappadiag22(1,n*50+k) = img{n+1,1}(i+1,j-1)/img{k,1}(i-1,j+1);
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