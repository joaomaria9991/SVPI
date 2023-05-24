%% TemplateCodeSVPI -------------------------------------------------------
% Name:       Miguel Oliveira
% Num. Mec:   .....
% Date:       2020

%% Initial configurations
clc % Clear all text from command window
close all % Close all figures previously opened
clear % Clear previous environment variables
%addpath('../lib') % Update yout matlab path (the folder must exist)

list_of_exercises = { %Add, comment or uncomment at will
 % 'Ex1'
%   'Ex5'
%   'Ex6'
%   'Ex7'
%   'Ex10'
   'Ex11'  %Tenho uma asneira que não consigo detetar 
%   'Ex3'
%   'Ex4'
%   'Ex9'
  }; %Defines the exercise to be executed (one or more at a time).


%% Ex1a -------------------------------------------------------------------

exercise = 'Ex1'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  A=im2double(imread('Manycoins.png'));
  A=A>0.18;
  figure()


  subplot(3,1,1)
  imshow(A)
% 
%   Aeroded=bwmorph(A,'erode',1);
%   subplot(3,1,2);
%   imshow(Aeroded);

  Adilate=bwmorph(A,'dilate',1);

  subplot(3,1,3);
  imshow(Adilate);
  num_white_original=nnz(A);

  for i=1:400
      Aeroded=bwmorph(A,'erode',1);
      subplot(3,1,2);
      imshow(Aeroded);
      num_white=nnz(Aeroded);
      title(['Aeroded' num2str(num_white)]);

       if num_white <num_white_original
           break
       end
       pause(1)



  end

  
end


%% Ex5 -------------------------------------------------------------------

exercise = 'Ex5'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  A=rand(300,300)>0.995;
  imshow(A)

  SE=strel('diamond',8);
  B=imdilate(A,SE);
  imshow(B)



end




%% Ex6 -------------------------------------------------------------------

exercise = 'Ex6'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  A=im2double(imread('pcb2.png'));
  A=im2bw(A);
  imshow(A)

%compute skeleton

B=bwmorph(A,'skel',inf);
figure()
imshow(B)
hold on
pause(0.2)


%detect crosses
H=[0 1 0; 1 1 1; 0 1 0];
M=~H;

Mcrosses=bwhitmiss(B,H,M);
[ys xs]=find(Mcrosses);

plot(xs,ys,'*g','MarkerSize',15)
hold on

%Detect intersections
H=[0 0 0; 1 1 1; 0 1 0];
M=~H;


for i=1:4
    H=rot90(H,1);
    M=~H;

Mint=bwhitmiss(B,H,M);
[ys xs]=find(Mint)
plot(xs,ys,'*r','MarkerSize',15)



end

end




%% Ex7 -------------------------------------------------------------------

exercise = 'Ex7'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars

  A=im2double(imread('pcb.png'));
  A=im2bw(A,0.5);
  imshow(A)
  title('Original')
  pause(0.4)

  %usar shrink para separar os objetos sólidos dos não sólidos

  B=bwmorph(A,'shrink',inf);
  figure
  imshow(B)
  title('Shrink')


  %Detetar pontos bracos isolados para separa os objetos sólidos

  F=[1 1 1; 1 -8 1; 1 1 1];
  R=filter2(F,B);
  Miso=R==-8;
  [ys xs]= find(Miso);
  figure(1); hold on;
  pause(0.5)
  plot(xs,ys,'*r');

  %Dilatação para obter uma imagem para "descontar" os furos das imagens


  SE=strel('disk',8);
  Mfuros=~imdilate(Miso,SE);
  figure();hold on;
  pause(0.5)
  imshow(Mfuros)

  %subtração dos furos
  C=and(A,Mfuros);
  figure(); hold on;
  pause(0.5)
  imshow(C)
  title('Sem furos')



end


%% Ex10 -------------------------------------------------------------------


exercise = 'Ex10'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  A=im2double(imread('porcas.png'));
  A=~im2bw(A);  
  imshow(A);

  B=imfill(A,'holes');
  figure;
  imshow(B)



end



%% Ex10 -------------------------------------------------------------------


exercise = 'Ex11'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  
  A=im2double(imread('porcas.png'));
  t=graythresh(A);
  A=~(A>t);%~im2bw(A); 
  imshow(A)

  %Calcular o shrink
  B=bwmorph(A,'shrink',inf);
  figure()
  imshow(B)

  F=[1 1 1; 1 -8 1; 1 1 1];
  Miso=filter2(F,B)==-8;
  figure()
  imshow(Miso)


  Msolidos=imreconstruct(Miso,A);
  figure;
  imshow(Msolidos)
  pause(0.5); title('M solidos')


  [ys xs]=find(Miso);
  hold on;
  plot(xs,ys,'--b')


  Marker_nao_solidos=logical(B-Miso);
  Mnao_solidos=imreconstruct(Marker_nao_solidos,A);
  figure;
  imshow(Mnao_solidos)
  pause(0.5);title('M nao solidos')
  

  [ys xs]=find(Marker_nao_solidos);
  hold on;
  plot(xs,ys,'.-b')







end


%% Ex3 -------------------------------------------------------------------
exercise = 'Ex3'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  img = im2double(imread('Manycoins.png'));
  
  BW = imbinarize(img,0.18);
  tot = sum(sum(BW));
  
  closedImage = bwmorph(BW, 'close');
  pixeisComum = (BW == 1) & (closedImage == 1);
  comC = sum(sum(pixeisComum));
  
  opennedImage = bwmorph(BW, 'open');
  pixeisComum = (BW == 1) & (opennedImage == 1);
  comO = sum(sum(pixeisComum));
  
  subplot(1,3,1)
  imshow(BW)
  title('A')
  xlabel(sprintf('%d pixeis brancos', tot));
  
  subplot(1,3,2)
  imshow(closedImage)
  title('Close')
  xlabel(sprintf('%d pixeis brancos', comC));
  
  subplot(1,3,3)
  imshow(opennedImage)
  title('Open')
  xlabel(sprintf('%d pixeis brancos', comO));
  
end

%% Ex4 -------------------------------------------------------------------

exercise = 'Ex4'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  nlinhas = 300; ncolunas = 300;
  img = zeros(nlinhas,ncolunas);
  
  % criar pixeis brancos
  for linha = 10:20:nlinhas
      for coluna = 10:20:ncolunas
          img(linha,coluna) = 1;
      end
  end
  
  % Elemento estruturante
  SE1 = ones(1,10);
  B = imdilate(img,SE1);
  
  subplot(1,2,1)
  imshow(img)
  title('Original')
  subplot(1,2,2)
  imshow(B)
  
end

%% Ex9 -------------------------------------------------------------------
exercise = 'Ex9'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  img = rgb2gray(im2double(imread('pcb_holes.png')));
  A = ~(imbinarize(img,0.5)); % temos que inverter a imagem para os furos estarem a branco
  figure;
  subplot(1,2,1)
  imshow(A)
  
  % Pré processamento para remover os furos
  B = bwmorph(A, 'shrink', Inf);
  subplot(1,2,2)
  imshow(B)
  hold on;
  
  % Deteção de pontos isolados
  F = [1 1 1; 1 -8 1; 1 1 1];
  R = filter2(F,B);
  Miso = (R == -8);
  pts_iso = nnz(Miso)
  figure;
  imshow(Miso)
  
  figure;
  imshow(~A); 
  hold on
  [ys, xs] = find(Miso);
  plot(xs, ys, 'y.', 'MarkerSize', 10)   
    
end

