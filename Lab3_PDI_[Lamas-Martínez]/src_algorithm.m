%   Implementation of
%   Spectral Ratio Contrast Algorithm for Edge Detection.
%   Cristian Martínez - Felipe Lamas.

%%  Entrenamiento.

clear all;
close all;
clc;

% Lectura de imagenes.
img(:,:,:,1) = imread('img1.png');
img(:,:,:,2) = imread('img2.png');
img(:,:,:,3) = imread('img3.png');
img(:,:,:,4) = imread('img4.png');
img(:,:,:,5) = imread('img5.png');
img(:,:,:,6) = imread('img6.png');
img(:,:,:,7) = imread('img7.png');
img(:,:,:,8) = imread('img8.png');
img(:,:,:,9) = imread('img9.png');
img(:,:,:,10) = imread('img10.png');
img(:,:,:,11) = imread('img11.png');
img(:,:,:,12) = imread('img12.png');
img(:,:,:,13) = imread('img13.png');
img(:,:,:,14) = imread('img14.png');
img(:,:,:,15) = imread('img15.png');
img(:,:,:,16) = imread('img16.png');
img(:,:,:,17) = imread('img17.png');
img(:,:,:,18) = imread('img18.png');
img(:,:,:,19) = imread('img19.png');
img(:,:,:,20) = imread('img20.png');
img(:,:,:,21) = imread('img21.png');
img(:,:,:,22) = imread('img22.png');
img(:,:,:,23) = imread('img23.png');
img(:,:,:,24) = imread('img24.png');
img(:,:,:,25) = imread('img25.png');

% Preasignacion de variables para velocidad en iteracion.
meanredlunar = zeros(1,25);
meanredpiel = zeros(1,25);
meangreenlunar = zeros(1,25);
meangreenpiel = zeros(1,25);
meanbluelunar = zeros(1,25);
meanbluepiel = zeros(1,25);

% Contadores para efectuar promedios.
countredlunar = 0;
countredpiel = 0;
countgreenlunar = 0;
countgreenpiel = 0;
countbluelunar = 0;
countbluepiel = 0;

% Ciclo for para efectuar promedios de intensidades de pixeles
% en distintas bandas para distintos materiales (Lunar y Piel)
% de las 25 imagenes.
for l = 1:25
    % Separación de imagen en 3 bandas (R, G y B).
    imgred = img(:,:,1,l);
    imggreen = img(:,:,2,l);
    imgblue = img(:,:,3,l);
    
    % Caracterización de materiales (Lunar y Piel).
    masklunar = roipoly(img(:,:,:,l));
    maskpiel = roipoly(img(:,:,:,l));
    close all
    
    % Casting para manejo matematico de imagen en distintas bandas.
    imgred = double(imgred);
    imggreen = double(imggreen);
    imgblue = double(imgblue);

    % Promedios intensidades pixeles de ambos materiales
    % de la imagen en banda roja.
    
    % Lunar en banda roja.
    imgredlunar = masklunar.*imgred;

    suma = 0;
    count = 0;

    for i = 1:480
        for j = 1:640
            if(imgredlunar(i,j) ~= 0)
                suma = suma + imgredlunar(i,j);
                count = count + 1;
            end
        end
    end
    
    if(count == 0) % Si no existe pixel distinto de cero, entonces
        % promedio sera cero.
        meanredlunar(l) = 0;
    else
        meanredlunar(l) = suma/count;
        countredlunar = countredlunar + 1;
    end
    
    % Piel en banda roja.
    imgredpiel = maskpiel.*imgred;

    suma = 0;
    count = 0;

    for i = 1:480
        for j = 1:640
            if(imgredpiel(i,j) ~= 0)
                suma = suma + imgredpiel(i,j);
                count = count + 1;
            end
        end
    end

    if(count == 0) % Si no existe pixel distinto de cero, entonces
        % promedio sera cero.
        meanredpiel(l) = 0;
    else
        meanredpiel(l) = suma/count;
        countredpiel = countredpiel + 1;
    end
    
    % Promedios intensidades pixeles de ambos materiales
    % de la imagen en banda verde.
    
    % Lunar en banda verde.
    imggreenlunar = masklunar.*imggreen;

    suma = 0;
    count = 0;

    for i = 1:480
        for j = 1:640
            if(imggreenlunar(i,j) ~= 0)
                suma = suma + imggreenlunar(i,j);
                count = count + 1;
            end
        end
    end

    if(count == 0) % Si no existe pixel distinto de cero, entonces
        % promedio sera cero.
        meangreenlunar(l) = 0;
    else
        meangreenlunar(l) = suma/count;
        countgreenlunar = countgreenlunar + 1;
    end
    
    % Piel en banda verde.
    imggreenpiel = maskpiel.*imggreen;

    suma = 0;
    count = 0;

    for i = 1:480
        for j = 1:640
            if(imggreenpiel(i,j) ~= 0)
                suma = suma + imggreenpiel(i,j);
                count = count +1;
            end
        end
    end

    if(count == 0) % Si no existe pixel distinto de cero, entonces
        % promedio sera cero.
        meangreenpiel(l) = 0;
    else
        meangreenpiel(l) = suma/count;
        countgreenpiel = countgreenpiel + 1;
    end

    % Promedios intensidades pixeles de ambos materiales
    % de la imagen en banda azul.
    
    % Lunar en banda azul.
    imgbluelunar = masklunar.*imgblue;

    suma = 0;
    count = 0;

    for i = 1:480
        for j = 1:640
            if(imgbluelunar(i,j) ~= 0)
                suma = suma + imgbluelunar(i,j);
                count = count + 1;
            end
        end
    end

    if(count == 0) % Si no existe pixel distinto de cero, entonces
        % promedio sera cero.
        meanbluelunar(l) = 0;
    else
        meanbluelunar(l) = suma/count;
        countbluelunar = countbluelunar + 1;
    end
    
    % Piel en banda azul.
    imgbluepiel = maskpiel.*imgblue;

    suma = 0;
    count = 0;

    for i = 1:480
        for j = 1:640
            if(imgbluepiel(i,j) ~= 0)
                suma = suma + imgbluepiel(i,j);
                count = count + 1;
            end
        end
    end

    if(count == 0) % Si no existe pixel distinto de cero, entonces
        % promedio sera cero.
        meanbluepiel(l) = 0;
    else
        meanbluepiel(l) = suma/count;
        countbluepiel = countbluepiel + 1;
    end
end

% Promedios de vector de promedios de ambos materiales
% en cada una de las bandas.
meanredlunar = sum(meanredlunar)/countredlunar;
meanredpiel = sum(meanredpiel)/countredpiel;
meangreenlunar = sum(meangreenlunar)/countgreenlunar;
meangreenpiel = sum(meangreenpiel)/countgreenpiel;
meanbluelunar = sum(meanbluelunar)/countbluelunar;
meanbluepiel = sum(meanbluepiel)/countbluepiel;

% Vector patron que caracteriza ambos materiales mediante divisiones
% de sus promedios de pixeles en cada banda.
rhor = [meanredlunar/meanredpiel meanredlunar/meangreenpiel meanredlunar/meanbluepiel ...
    meangreenlunar/meanredpiel meangreenlunar/meangreenpiel meangreenlunar/meanbluepiel ...
    meanbluelunar/meanredpiel meanbluelunar/meangreenpiel meanbluelunar/meanbluepiel];

%%  Deteccion de Borde.

% Lectura y separacion en 3 bandas (R, G, y B) de imagen
% para deteccion de bordes de lunar.
img = imread('img7.png');
imgred = double(img(:,:,1));
imggreen = double(img(:,:,2));
imgblue = double(img(:,:,3));

% Parametro de tolerancia (Se debe ajustar para lograr eficaz
% deteccion y minimizacion de ruido).
epsilon = 0.36;

% Preasignacion de variable para velocidad en iteracion.
Edges = zeros(480,640);

% Proceso de deteccion de borde de lunar mediante division
% de pixeles con mascara de 3x3.
for i = 2:479
    for j = 2:639
        kappahoriz1 = [imgred(i-1,j)/imgred(i+1,j) imgred(i-1,j)/imggreen(i+1,j) imgred(i-1,j)/imgblue(i+1,j) ...
           imggreen(i-1,j)/imgred(i+1,j) imggreen(i-1,j)/imggreen(i+1,j) imggreen(i-1,j)/imgblue(i+1,j) ...
           imgblue(i-1,j)/imgred(i+1,j) imgblue(i-1,j)/imggreen(i+1,j) imgblue(i-1,j)/imgblue(i+1,j)];
        kappahoriz2 = [imgred(i+1,j)/imgred(i-1,j) imgred(i+1,j)/imggreen(i-1,j) imgred(i+1,j)/imgblue(i-1,j) ...
           imggreen(i+1,j)/imgred(i-1,j) imggreen(i+1,j)/imggreen(i-1,j) imggreen(i+1,j)/imgblue(i+1,j) ...
           imgblue(i-1,j)/imgred(i+1,j) imgblue(i+1,j)/imggreen(i-1,j) imgblue(i+1,j)/imgblue(i-1,j)];
        x(1) = max(abs(kappahoriz1 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        x(2) = max(abs(kappahoriz2 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        
        kappavert1 = [imgred(i,j-1)/imgred(i,j+1) imgred(i,j-1)/imggreen(i,j+1) imgred(i,j-1)/imgblue(i,j+1) ...
            imggreen(i,j-1)/imgred(i,j+1) imggreen(i,j-1)/imggreen(i,j+1) imggreen(i,j-1)/imgblue(i,j+1) ...
            imgblue(i,j-1)/imgred(i,j+1) imgblue(i,j-1)/imggreen(i,j+1) imgblue(i,j-1)/imgblue(i,j+1)];
        kappavert2 = [imgred(i,j+1)/imgred(i,j-1) imgred(i,j+1)/imggreen(i,j-1) imgred(i,j+1)/imgblue(i,j-1) ...
           imggreen(i,j+1)/imgred(i,j-1) imggreen(i,j+1)/imggreen(i,j-1) imggreen(i,j+1)/imgblue(i,j-1) ...
           imgblue(i,j+1)/imgred(i,j-1) imgblue(i,j+1)/imggreen(i,j-1) imgblue(i,j+1)/imgblue(i,j-1)];
        x(3) = max(abs(kappavert1 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        x(4) = max(abs(kappavert2 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        
        kappadiag11 = [imgred(i-1,j-1)/imgred(i+1,j+1) imgred(i-1,j-1)/imggreen(i+1,j+1) imgred(i-1,j-1)/imgblue(i+1,j+1) ...
           imggreen(i-1,j-1)/imgred(i+1,j+1) imggreen(i-1,j-1)/imggreen(i+1,j+1) imggreen(i-1,j-1)/imgblue(i+1,j+1) ...
           imgblue(i-1,j-1)/imgred(i+1,j+1) imgblue(i-1,j-1)/imggreen(i+1,j+1) imgblue(i-1,j-1)/imgblue(i+1,j+1)];
        kappadiag12 = [imgred(i+1,j+1)/imgred(i-1,j-1) imgred(i+1,j+1)/imggreen(i-1,j-1) imgred(i+1,j+1)/imgblue(i-1,j-1) ...
           imggreen(i+1,j+1)/imgred(i-1,j-1) imggreen(i+1,j+1)/imggreen(i-1,j-1) imggreen(i+1,j+1)/imgblue(i-1,j-1) ...
           imgblue(i+1,j+1)/imgred(i-1,j-1) imgblue(i+1,j+1)/imggreen(i-1,j-1) imgblue(i+1,j+1)/imgblue(i-1,j-1)];
        x(5) = max(abs(kappadiag11 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        x(6) = max(abs(kappadiag12 - rhor)) < epsilon; % Si el mayor valor de la diferencia absoluta cumple
        % la condicion, entonces las demas tambien lo hacen.
        
        kappadiag21 = [imgred(i-1,j+1)/imgred(i+1,j-1) imgred(i-1,j+1)/imggreen(i+1,j-1) imgred(i-1,j+1)/imgblue(i+1,j-1) ...
           imggreen(i-1,j+1)/imgred(i+1,j-1) imggreen(i-1,j+1)/imggreen(i+1,j-1) imggreen(i-1,j+1)/imgblue(i+1,j-1) ...
           imgblue(i-1,j+1)/imgred(i+1,j-1) imgblue(i-1,j+1)/imggreen(i+1,j-1) imgblue(i-1,j+1)/imgblue(i+1,j-1)];
        kappadiag22 = [imgred(i+1,j-1)/imgred(i-1,j+1) imgred(i+1,j-1)/imggreen(i-1,j+1) imgred(i+1,j-1)/imgblue(i-1,j+1) ...
           imggreen(i+1,j-1)/imgred(i-1,j+1) imggreen(i+1,j-1)/imggreen(i-1,j+1) imggreen(i+1,j-1)/imgblue(i-1,j+1) ...
           imgblue(i+1,j-1)/imgred(i-1,j+1) imgblue(i+1,j-1)/imggreen(i-1,j+1) imgblue(i+1,j-1)/imgblue(i-1,j+1)];
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

% Ciclo for para visualizar bordes de lunar en imagen original.
for i = 1:480
    for j = 1:640
        if(Edges(i,j) ~= 0)
            img(i,j,1) = 255; % Con esto podremos visualizar
            % el borde con color rojo.
            img(i,j,2) = 0;
            img(i,j,3) = 0;
        end
    end
end

figure(1)
imshow(img)