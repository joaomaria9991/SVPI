%% Ex1
clear
clc

img = im2double(imread("bolt1.png"));
theta = pi/4;

% Solução 1 - específica
newImg1 = imrotate(img, -theta*180/pi);
figure(1); imshow(newImg1);

% Solução 2 - abordagem geral
T = rot(theta);
mat_tf = affine2d(T');     % matriz transformação

% aplicar a matriz rotação
newImg2 = imwarp(img, mat_tf);
figure(2); imshow(newImg2);

%% Ex2_a
clear
clc

img = im2double(imread("bolt1.png"));
img = padarray(img, [1 1], 1, "both");
cols = 600; lins = 400; theta = 2*pi*rand;
x = randi([0 cols], 1); y = randi([0 lins], 1);
T = trans(x, y) * rot(theta);
mat_tf = affine2d(T');

R0 = imref2d([lins cols]);
newImg1 = imwarp(img, mat_tf, "OutputView", R0, "SmoothEdges", true);
figure(1); imshow(newImg1);

%% Ex2_b
clear
clc

img = im2double(imread("bolt1.png"));
width = size(img, 2); height = size(img, 1);
imgxlim = [-width/2 width/2]; imgylim = [-height/2 height/2];
img = padarray(img, [1 1], 1, "both");
Ri = imref2d(size(img), imgxlim, imgylim);

cols = 600; lins = 400; theta = 2*pi*rand;
x = randi([0 cols], 1); y = randi([0 lins], 1);

T = trans(x, y) * rot(theta);
mat_tf = affine2d(T');

R0 = imref2d([lins cols]);
newImg1 = imwarp(img, mat_tf, "OutputView",R0 , "SmoothEdges", true);
subplot(2, 1, 1);
imshow(newImg1);

newImg2 = imwarp(img, Ri, mat_tf, "nearest", "OutputView",R0 , "SmoothEdges", true);
subplot(2, 1, 2);
imshow(newImg2);

%% Ex2_c
clear
clc

img = im2double(imread("bolt1.png"));
img = padarray(img, [1 1], 1, "both");
cols = 600; lins = 400; 

R0 = imref2d([lins cols]);
%newImg = imwarp(img, mat_tf, "OutputView", R0, "SmoothEdges", true);
compImg = zeros(lins, cols);

for i = 1:5
    x = randi([0 cols], 1); y = randi([0 lins], 1); theta = 2*pi*rand;
    T = trans(x, y)*rot(theta);
    mat_tf = affine2d(T');

    singleBolt = imwarp(img, mat_tf, "OutputView", R0, "SmoothEdges", true);
    compImg = max(compImg, singleBolt);
end

imshow(compImg);

%% Ex2_d


%% Ex3_a
clear
clc

%% Ex3_b
clear
clc

%% Ex4_a
clear
clc

% Definição do espaço para a imagem final
imLins = 240;
imCols = 320;
img = zeros(imLins, imCols);

% Criação de um objeto no espaço a 3D
% Ex: círculo com 50 pontos
t = linspace(0, 2*pi, 50);
P = [5*cost(t);
    5*sin(t);
    30*onse(size(t))];

%% Ex4_b
clear
clc

%% Ex4_c
clear
clc

%% Ex4_d
clear
clc

%% Ex4_e
clear
clc

%% Ex4_f
clear
clc

%% Ex4_g
clear
clc

%% Ex5
clear
clc
