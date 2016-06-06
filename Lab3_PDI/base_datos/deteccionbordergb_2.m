% Implementacion of
% Spectral Ratio Contrast Algorithm for Edge Detection.
% Cristian Martínez - Felipe Lamas.

%%

clear all;
close all;
clc;

img = imread('img8.jpg');
imgr = img(:,:,1);
imgg = img(:,:,2);
imgb = img(:,:,3);
T = 130;

% Model-Based Edge Signature Identification
% red
imgrlunar = min(imgr,T);
imgrlunar = double(imgrlunar);
imgrlunarmin = imgrlunar < T;
imgrlunarmin = uint8(imgrlunarmin);
imgr01 = imgr.*imgrlunarmin;
%imgr01 = imgr01(180:300,190:380);
meanr01 = mean(mean(imgr01));

figure(1)
imshow(imgr01)
imgrpiel = max(imgr,T);
imgrpiel = double(imgrpiel);
imgrpielmax = imgrpiel > T;
imgrpielmax = uint8(imgrpielmax);
imgr02 = imgr.*imgrpielmax;
%imgr02 = imgr02(180:300,190:380);
meanr02 = mean(mean(imgr02));
figure(2)
imshow(imgr02)

%green
imgglunar = min(imgg,T);
imgglunar = double(imgglunar);
imgglunarmin = imgglunar < T;
imgglunarmin = uint8(imgglunarmin);
imgg01 = imgg.*imgglunarmin;
%imgg01 = imgg01(180:300,190:380);
meang01 = mean(mean(imgg01));

figure(3)
imshow(imgg01)
imggpiel = max(imgg,T);
imggpiel = double(imggpiel);
imggpielmax = imggpiel > T;
imggpielmax = uint8(imggpielmax);
imgg02 = imgg.*imggpielmax;
%imgg02 = imgg02(180:300,190:380);
meang02 = mean(mean(imgg02));
figure(4)
imshow(imgg02)

%blue
imgblunar = min(imgb,T);
imgblunar = double(imgblunar);
imgblunarmin = imgblunar < T;
imgblunarmin = uint8(imgblunarmin);
imgb01 = imgb.*imgblunarmin;
%imgb01 = imgb01(180:300,190:380);
meanb01 = mean(mean(imgb01));

figure(5)
imshow(imgb01)
imgbpiel = max(imgb,T);
imgbpiel = double(imgbpiel);
imgbpielmax = imgbpiel > T;
imgbpielmax = uint8(imgbpielmax);
imgb02 = imgb.*imgbpielmax;
%imgb02 = imgb02(180:300,190:380);
meanb02 = mean(mean(imgb02));
figure(6)
imshow(imgb02)

rhor = [meanr01/meanr02 meang01/meang02 meanb01/meanb02;...
    meanr01/meanr02 meang01/meang02 meanb01/meanb02];

imgr = double(imgr);
imgg = double(imgg);
imgb = double(imgb);
%% Sparse Spatio-Spectral Mask Development

e = 0.75;

for i = 2:479
    for j = 2:639
        kappammas = [imgr(i-1,j)/imgr(i+1,j) imgg(i-1,j)/imgg(i+1,j) imgb(i-1,j)/imgb(i+1,j);...
            imgr(i,j-1)/imgr(i,j+1) imgg(i,j-1)/imgg(i,j+1) imgb(i,j-1)/imgb(i,j+1)];
        x = abs(kappammas - rhor) < e;
        A(i-1,j-1) = any(any(x));
    end
end

for i = 2:479
    for j = 2:639
        kappammenos = [imgr(i+1,j)/imgr(i-1,j) imgg(i+1,j)/imgg(i-1,j) imgb(i+1,j)/imgb(i-1,j);...
            imgr(i,j+1)/imgr(i,j-1) imgg(i,j+1)/imgg(i,j-1) imgb(i,j+1)/imgb(i,j-1)];
        x = abs(kappammenos - rhor) < e;
        B(i-1,j-1) = any(any(x));
    end
end

kappa2 = A+B;
figure(7)
imshow(kappa2)

%%
R  = 0.11;
for i = 1:478
    for j = 1:638
        if((norm(kappa2(i,j),inf) >= R))
            C(i,j) = 1;
        end
    end
end

figure(8)
imshow(C)