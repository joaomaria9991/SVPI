%% TemplateCodeSVPI -------------------------------------------------------
% Name:       João Maria
% Num. Mec:   89132
% Date:       2022

%% Initial configurations
clc % Clear all text from command window
close all % Close all figures previously opened
clear % Clear previous environment variables
%addpath('../lib') % Update yout matlab path (the folder must exist)

list_of_exercises = { %Add, comment or uncomment at will
%   'Ex1'
%   'Ex2'
%   'Ex3'
  'Ex4a'
%   'Ex4b'
%   'Ex5'
%   'Ex6'
%   'Ex7'
%   'Ex8'
%   'Ex9'
% 
  }; %Defines the exercise to be executed (one or more at a time).


%% Ex1 -------------------------------------------------------------------

exercise = 'Ex1'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  A = im2double(imread('nuts2a.jpg'));
  figure;
  imshow(A)
  
  % binarização
  A = im2bw(A); % imagem a preto e branco
  A = ~A;
  figure;
  imshow(A)
  
  % preenchimento de buracos
  A = imfill(A, 'holes');
  % remoçao de objetos no bordo
  A = imclearborder(A); % Remover objetos nas bordas
  A = bwmorph(A, 'open');
  figure;
  imshow(A)
  
  % contar o número de objetos
  [L, numObj]= bwlabel(A);
  
  % Representar cada objeto numa imagem isolado (subplot)
  figure;
  for idk_obj = 1:numObj
      imshow(L == idk_obj)
      pause(1)
  end
  
end

%% Ex2 -------------------------------------------------------------------
exercise = 'Ex2'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  A = im2double(imread('traffic_signs.jpg'));
  figure;
  imshow(A)
  
  % binarização
  A = im2bw(A); % imagem a preto e branco
  A = ~A;
  figure;
  imshow(A)
  
  % preenchimento de buracos
  A = imfill(A, 'holes');
  A = bwmorph(A, 'open');
  figure;
  imshow(A)
  
  [L, numObj]= bwlabel(A);
  
  s = regionprops(L, 'Circularity','Centroid');
  
  for idx_obj = 1:numObj
      obj = s(idx_obj);
      text(obj.Centroid(1)-20, obj.Centroid(2), num2str(obj.Circularity));
      pause(1)
  end
  
  ff = [s.Circularity];
  tri_lim = 0.7;
  circ_lim = 0.9;
  sq_lim = 0.79;
  
  tri_idx = find( ff < tri_lim);
  circ_idx = find( ff > circ_lim);
  sq_idx = find( ff > tri_lim & ff < circ_lim);
  
  TRI = ismember(L, tri_idx);
  SQ = ismember(L, sq_idx);
  CIRC = ismember(L, circ_idx);
  
  figure;
  subplot(1,3,1)
  imshow(TRI); title('Triangles')
  subplot(1,3,2)
  imshow(SQ); title('Squares')
  subplot(1,3,3)
  imshow(CIRC); title('Circles')
end

%% Ex3 -------------------------------------------------------------------
exercise = 'Ex3'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  

  I = im2double(imread('traffic_signs_jam1.jpg'));
  figure;
  imshow(I)
  
  % binarização
  A = im2bw(I); % imagem a preto e branco
  A = ~A;
  figure;
  imshow(A)
  
  % preenchimento de buracos
  A = imfill(A, 'holes');
  A = bwmorph(A, 'open');
  figure;
  imshow(A)
  
  [L, numObj]= bwlabel(A);
  
  s = regionprops(L, 'Circularity','Centroid');
  
  ff = [s.Circularity];
  tri_lim = 0.7;
  circ_lim = 0.9;
  sq_lim = 0.79;
  
  tri_idx = find( ff < tri_lim);
  circ_idx = find( ff > circ_lim);
  sq_idx = find( ff > tri_lim & ff < circ_lim);
  
  TRI = ismember(L, tri_idx);
  SQ = ismember(L, sq_idx);
  CIRC = ismember(L, circ_idx);
  
  figure;
  subplot(2,3,1)
  imshow(TRI); title('Triangles')
  subplot(2,3,2)
  imshow(SQ); title('Squares')
  subplot(2,3,3)
  imshow(CIRC); title('Circles')

  I_TRI = I;
  % [linhas colunas] = find(TRI == 0);
%   I_TRI(linhas, colunas, 1) = 1;
%   I_TRI(linhas, colunas, 2) = 1;
%   I_TRI(linhas, colunas, 3) = 1;
  I_TRI_1 = I_TRI(:,:,1); I_TRI_2 = I_TRI(:,:,2); I_TRI_3 = I_TRI(:,:,3);
  I_TRI_1(~TRI) = 1; I_TRI_2(~TRI) = 1; I_TRI_3(~TRI) = 1;
  I_TRI(:,:,1) = I_TRI_1; I_TRI(:,:,2) = I_TRI_2; I_TRI(:,:,3) = I_TRI_3;

  I_SQ = I;
  I_SQ_1 = I_SQ(:,:,1); I_SQ_2 = I_SQ(:,:,2); I_SQ_3 = I_SQ(:,:,3);
  I_SQ_1(~SQ) = 1; I_SQ_2(~SQ) = 1; I_SQ_3(~SQ) = 1;
  I_SQ(:,:,1) = I_SQ_1; I_SQ(:,:,2) = I_SQ_2; I_SQ(:,:,3) = I_SQ_3;
  
  I_CIRC = I;
  I_CIRC_1 = I_CIRC(:,:,1); I_CIRC_2 = I_CIRC(:,:,2); I_CIRC_3 = I_CIRC(:,:,3);
  I_CIRC_1(TRI) = 1; I_CIRC_2(TRI) = 1; I_CIRC_3(TRI) = 1;
  I_CIRC_1(SQ) = 1; I_CIRC_2(SQ) = 1; I_CIRC_3(SQ) = 1;
  I_CIRC(:,:,1) = I_CIRC_1; I_CIRC(:,:,2) = I_CIRC_2;I_CIRC(:,:,3) = I_CIRC_3;

  subplot(2,3,4)
  imshow(I_TRI); title('Triangles')
  subplot(2,3,5)
  imshow(I_SQ); title('Squares')
  subplot(2,3,6)
  imshow(I_CIRC); title('Circles')

end

%% Ex4a -------------------------------------------------------------------

exercise = 'Ex4a'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  A = im2double(imread('talheres_individuais.jpg'));
  
%   A = rgb2gray(A);
  B = ~imbinarize(A, graythresh(A)); 
  figure;
  imshow(B)
  
  [L, numObj]= bwlabel(B);
  
   s = regionprops(L, 'Solidity','Circularity', 'Centroid');
   
  for k = 1:numObj
      obj = s(k);
      text(obj.Centroid(1)-20, obj.Centroid(2), num2str(k));
  end
  
  % create the model
  
  m.fork.Solidity = s(1).Solidity;
  m.fork.Circularity = s(1).Circularity;
  
  m.knive.Solidity = s(2).Solidity;
  m.knive.Circularity = s(2).Circularity;
  
  m.spoon.Solidity = s(3).Solidity;
  m.spoon.Circularity = s(3).Circularity;
  
  % a estrutura m vai ser precisa para o exercício 4b)
  save('model4a.mat', 'm')
 
  
end

%% Ex4b -------------------------------------------------------------------
exercise = 'Ex4b'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % load model
  load('model4a.mat')
  
  % Read image and preprocess it
  A = im2double(imread('talheres.jpg'));
  B = ~im2bw(A, graythresh(A)); 
  C = imclearborder(B);
  D = imfill(C, 'holes');
  D = imclose(D, ones(3));
  
  figure;
  imshow(D)
  
  % Separate objects and compute properties for each
  [L, numObj]= bwlabel(D);
  s = regionprops(L, 'Solidity','Circularity', 'Centroid');
  
  for k = 1:numObj
      obj = s(k);
      text(obj.Centroid(1), obj.Centroid(2), num2str(k), 'Color', 'r');
  end
 
  
  % Cycle through all objects and classify each of them
  tol = 0.02;
  

  
  descriptors = {'Solidity'; 'Circularity'};
  classes = fields(m);
  for k = 1:size(s,1) % percorrer todos os objetos
      disp(['Object idx ' num2str(k)]);
      
      for descriptor_idx = 1:size(descriptors,1)
          descriptor = descriptors{descriptor_idx};
          s(k).Classification.(descriptor) = 'None';
          
          for class_idx = 1:size(classes,1) % percorrer as classes
              class = classes{class_idx};
              disp(['Class ' class]);
              
              if s(k).(descriptor) > m.(class).(descriptor) * (1-tol) && ...
                      s(k).(descriptor) < m.(class).(descriptor)*(1+tol)
                  s(k).Classification.(descriptor) = class;
                  
              end
          end
      end
  end
  
  % falta fazer os plots
  figure;

  % circularity
  Mforks = logical(A*0);
  Mknive = logical(A*0);
  Mspoon = logical(A*0);
  M_Tot = logical(A*0);
  for k = 1:size(s,1) % percorrer todos os objetos
      if strcmp(s(k).Classification.Circularity,'fork')
          Mforks = or(Mforks, L == k);
      else if strcmp(s(k).Classification.Circularity,'knive')
              Mknive = or(Mknive, L == k);
          else if strcmp(s(k).Classification.Circularity,'spoon')
                  Mspoon = or(Mspoon, L == k);
              else M_Tot = or(M_Tot, L == k);
              end
          end
      end
      
  end

                  
  subplot(2,4,1); imshow(Mforks); title('Circularity - forks')
  subplot(2,4,2); imshow(Mknive); title('Circularity - knives')
  subplot(2,4,3); imshow(Mspoon); title('Circularity - spoons')
  subplot(2,4,4); imshow(M_Tot); title('Circularity - other')
  
  % Solidity
  Mforks = logical(A*0);
  Mknive = logical(A*0);
  Mspoon = logical(A*0);
  M_Tot = logical(A*0);
  for k = 1:size(s,1) % percorrer todos os objetos
      if strcmp(s(k).Classification.Solidity,'fork')
          Mforks = or(Mforks, L == k);
      else if strcmp(s(k).Classification.Solidity,'knive')
              Mknive = or(Mknive, L == k);
          else if strcmp(s(k).Classification.Solidity,'spoon')
                  Mspoon = or(Mspoon, L == k);
              else M_Tot = or(M_Tot, L == k);
              end
          end
      end  
  end
  
  subplot(2,4,5); imshow(Mforks); title('Solidity - forks')
  subplot(2,4,6); imshow(Mknive); title('Solidity - knives')
  subplot(2,4,7); imshow(Mspoon); title('Solidity - spoons')
  subplot(2,4,8); imshow(M_Tot); title('Solidity - other')
  
end

%% Ex5 -------------------------------------------------------------------
exercise = 'Ex5'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
    
  I = im2double(imread('Seq1/TP2_img_01_01.png'));
  subplot(1,3,1);imshow(I);
  
  I = rgb2gray(I);
  
  B = imbinarize(I, 0.1); 
  C = imclearborder(B);
  subplot(1,3,2); imshow(B);
  subplot(1,3,3); imshow(C);
    
end


%% Ex6 -------------------------------------------------------------------
exercise = 'Ex6'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
      
    I = im2double(imread('Seq1/TP2_img_01_01.png'));
    subplot(1,3,1);imshow(I);
    
    I = rgb2gray(I);
    
    B = imbinarize(I,0);
    C = imclearborder(B);
    subplot(1,3,2); imshow(B);
    subplot(1,3,3); imshow(C);
    
    % Separate objects and compute properties for each
    figure; imshow(C)
    [L, numObj]= bwlabel(C);
    s = regionprops(L, 'EulerNumber', 'Area', 'Centroid');
    
    for k = 1:numObj
        obj = s(k);
        if obj.Area > 100
            text(obj.Centroid(1), obj.Centroid(2), num2str(k), 'Color', 'r');
        end
    end
    
    tol = 0.01;
    descriptors = {'EulerNumber'};
    classes = {'0'; '1'; '2'};
    for k = 1:size(s,1) % percorrer todos os objetos
        if s(k).Area >100
            disp(['Object idx ' num2str(k)]);
            
            for descriptor_idx = 1:size(descriptors,1)
                descriptor = descriptors{descriptor_idx};
                s(k).Classification.(descriptor) = 'None';
                
                for class_idx = 1:size(classes,1) % percorrer as classes
                    class = classes{class_idx};
                    disp(['Class ' class]);
                    a = abs(s(k).EulerNumber);
                    
                    if a == str2num(class)
                        s(k).Classification.(descriptor) = class;
                    end
                end
            end
        end
    end
    
    %   EulerNumber
    M2 = logical(C*0);
    M1 = logical(C*0);
    M0 = logical(C*0);
    M_Tot = logical(C*0);
    for k = 1:size(s,1) % percorrer todos os objetos
        if s(k).Area > 100
            if strcmp(s(k).Classification.EulerNumber,'2')
                M2 = or(M2, L == k);
            else if strcmp(s(k).Classification.EulerNumber,'1')
                    M1 = or(M1, L == k);
                else if strcmp(s(k).Classification.EulerNumber,'0')
                        M0 = or(M0, L == k);
                    else M_Tot = or(M_Tot, L == k);
                    end
                end
            end
        end
    end
    
    figure;
    subplot(2,2,1); imshow(M2); title('2 furos')
    subplot(2,2,2); imshow(M1); title('1 furo')
    subplot(2,2,3); imshow(M0); title('0 furos')
    subplot(2,2,4); imshow(M_Tot); title('Não classificado')
    
     
end

%% Ex7 -------------------------------------------------------------------
exercise = 'Ex7'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
    
    I = im2double(imread('Seq1/TP2_img_01_01.png'));
    subplot(1,3,1);imshow(I);
    
     I = rgb2gray(I);
    
    B = imbinarize(I,0);
    C = imclearborder(B);
    subplot(1,3,2); imshow(B);
    subplot(1,3,3); imshow(C);
    
    % Separate objects and compute properties for each
    figure; imshow(C)
    [L, numObj]= bwlabel(C);
    s = regionprops(L, 'All');
    
    % Solidity intervals
    soli = [0 0.5 0.6 0.7 1];
    lins = 2; cols = 2; % medidas para o subplot
    
    for k = 1:numObj
        obj = s(k);
        if obj.Area > 100
            text(obj.Centroid(1), obj.Centroid(2), num2str(k), 'Color', 'r');
        end
    end
    
    figure;
    for i = 2:numel(soli)
        idx = find([s.Solidity] > soli(i-1) & [s.Solidity] <= soli(i));
        m = ismember(L, idx);
        subplot(lins, cols, i-1); imshow(m);
        str = sprintf('Sol > %0.2f & Sol <= %0.2f', soli(i-1), soli(i));
        title(str);
    end
    


end


%% Ex8 -------------------------------------------------------------------
exercise = 'Ex8'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
    I = im2double(imread('Seq1/TP2_img_01_01.png'));
    subplot(1,3,1);imshow(I);
    
    B = im2bw(I,0.05);
    C = imclearborder(B);
    subplot(1,3,2); imshow(B);
    subplot(1,3,3); imshow(C);
    
    % Separate objects and compute properties for each
    figure; imshow(C)
    [L, numObj]= bwlabel(C);
    s = regionprops(L, 'All');
    
    % eccentricity) intervals
    ecc = [0 0.94 0.96 0.98 1];
    lins = 2; cols = 2; % medidas para o subplot
    
    for k = 1:numObj
        obj = s(k);
        if obj.Area > 100
            text(obj.Centroid(1), obj.Centroid(2), num2str(k), 'Color', 'r');
        end
    end
    
    figure;
    for i = 2:numel(ecc)
        idx = find([s.Eccentricity] > ecc(i-1) & [s.Eccentricity] <= ecc(i));
        m = ismember(L, idx);
        subplot(lins, cols, i-1); imshow(m);
        str = sprintf('ecc > %0.2f & ecc <= %0.2f', ecc(i-1), ecc(i));
        title(str);
    end
    
end

%% Ex9 -------------------------------------------------------------------
exercise = 'Ex9'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
          
    I = im2double(imread('Seq1/TP2_img_01_01.png'));
    subplot(1,3,1);imshow(I);
    
    I = rgb2gray(I);
    
    B = imbinarize(I,0);
    C = imclearborder(B);
    subplot(1,3,2); imshow(B);
    subplot(1,3,3); imshow(C);
    
    % Separate objects and compute properties for each
    figure; imshow(C)
    [L, numObj]= bwlabel(C);
    s = regionprops(L, 'All');
    
    % eccentricity) intervals
    circ = [0 0.15 0.2 0.3 1];
    lins = 2; cols = 2; % medidas para o subplot
    
    for k = 1:numObj
        obj = s(k);
        if obj.Area > 100
            text(obj.Centroid(1), obj.Centroid(2), num2str(k), 'Color', 'r');
        end
    end
    
    figure;
    for i = 2:numel(circ)
        idx = find([s.Circularity] > circ(i-1) & [s.Circularity] <= circ(i));
        m = ismember(L, idx);
        subplot(lins, cols, i-1); imshow(m);
        str = sprintf('circ > %0.2f & circ <= %0.2f', circ(i-1), circ(i));
        title(str);
    end
   
  
end

