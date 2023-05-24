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
       'Ex4'
    %
    }; %Defines the exercise to be executed (one or more at a time).


%% Ex1 -------------------------------------------------------------------

exercise = 'Ex1'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars

    IM=40;

    A=imread('TP2_img_01_01b.png');
    T=imread('tesoura_org_template.png');

    h=size(T,1);
    w=size(T,2);

    figure();
    imshow(A)

    R=normxcorr2(T,A);

    figure()
    imshow(R)
    pause(0.1)
    hold on;


    [ymax,xmax]=find(R==max(max(R)));
    plot(xmax, ymax,'*g','MarkerSize',18)


    y_max_A=ymax-h/2;
    x_max_A=xmax-w/2;
    %figure(1)
    pause(0.1)
    plot(x_max_A,y_max_A,'*g','MarkerSize',18)


    [L,num]=bwlabel(A);
    s=regionprops(A,'Centroid');

    min_length=9999999;
    min_length_obj_idx=-1;


    for k=1:length(s)
        x=s(k).Centroid(1);
        y=s(k).Centroid(2);
        text(x,y,num2str(k),'FontSize',15,'Color',[1 0 0])
        plot(x,y,'r*','MarkerSize',18)
        plot([x x_max_A],[y y_max_A],'b-')

        obj_length=sqrt((x-x_max_A)^2+(y-y_max_A)^2);

        if obj_length<min_length
            min_length=obj_length;
            min_length_obj_idx=k;

        end

    end

    min_length_obj_idx

end



%% Ex2 -------------------------------------------------------------------

exercise = 'Ex2'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars


       A = im2double(imread('TP2_img_01_01b.png'));
    % A = imbinarize(A);
    A = bwareaopen(A,200); % remove objetos com menos de 200 pixeis
    
    hf = figure; 
    imshow(A);
    pause(0.1);
    
    [L, numObj]= bwlabel(A);
    s = regionprops(L, 'Circularity','Solidity', 'Eccentricity','Centroid');

    % Desenhar os valores para cada objeto
    for k=1:size(s,1)
        x = s(k).Centroid(1);
        y = s(k).Centroid(2);
        
        text(x-30,y, num2str(k),'Color', [0.5 0.5 0], 'BackgroundColor', [1 1 1], 'EdgeColor', [1 0 0]);
        v = [s(k).Circularity s(k).Solidity s(k).Eccentricity];
        text(x,y, num2str(v',2),'Color', [0.5 0.5 0], 'BackgroundColor', [1 1 1], 'EdgeColor', [1 0 0]);
        
    end
    
    % Criar os modelos da pá e do serrote
    
    idx_pa = 1;
    m.pa.Circularity = s(idx_pa).Circularity;
    m.pa.Solidity = s(idx_pa).Solidity;
    m.pa.Eccentricity = s(idx_pa).Eccentricity;
    
    idx_ser = 4;
    m.ser.Circularity = s(idx_ser).Circularity;
    m.ser.Solidity = s(idx_ser).Solidity;
    m.ser.Eccentricity = s(idx_ser).Eccentricity;
    
    % Calcular as distâncias para calssificação
    
    classes = fields(m);
    
    for k = 1:size(s,1) %cycle all objects
        v_k = [s(k).Circularity s(k).Solidity s(k).Eccentricity]; % calcular o vetor de descritores
        for class_idx = 1:size(classes,1) % cycle all classes
            class = classes{class_idx};
            
            v_class = [m.(class).Circularity m.(class).Solidity m.(class).Eccentricity];
            nome_distancia = ['dist_' class];
            s(k).(nome_distancia) = norm(v_k-v_class);
        end
    end
    
    % fazer a tabela
    
    T = [(1:numObj)' [s.Circularity]' [s.Solidity]' [s.Eccentricity]' [s.dist_pa]' [s.dist_ser]']




end



%% Ex4 -------------------------------------------------------------------
exercise = 'Ex4'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  
  A = im2double(imread('TP2_img_01_01b.png'));
    % A = imbinarize(A);
    A = bwareaopen(A,200); % remove objetos com menos de 200 pixeis
    
    hf = figure; 
    imshow(A);
    pause(0.1);
    
    [L, numObj]= bwlabel(A);
    s = regionprops(L, 'Circularity','Solidity', 'Eccentricity','Centroid');

    % Desenhar os valores para cada objeto
    for k=1:size(s,1)
        x = s(k).Centroid(1);
        y = s(k).Centroid(2);
        
        text(x-30,y, num2str(k),'Color', [0.5 0.5 0], 'BackgroundColor', [1 1 1], 'EdgeColor', [1 0 0]);
        v = [s(k).Circularity s(k).Solidity s(k).Eccentricity];
        text(x,y, num2str(v',2),'Color', [0.5 0.5 0], 'BackgroundColor', [1 1 1], 'EdgeColor', [1 0 0]);
        
    end
    
    % Criar os modelos da pá e do serrote
    
    idx_pa = [1, 12, 14, 16, 17, 18];
    
    for k = 1:length(idx_pa)
        m.pa(k).Circularity = s(idx_pa(k)).Circularity;
        m.pa(k).Solidity = s(idx_pa(k)).Solidity;
        m.pa(k).Eccentricity = s(idx_pa(k)).Eccentricity;
    end
    X_pa = [m.pa.Circularity; m.pa.Solidity; m.pa.Eccentricity]';
    
    
    idx_ser = [4, 6 19];
    for k = 1:length(idx_ser)
        m.ser(k).Circularity = s(idx_ser(k)).Circularity;
        m.ser(k).Solidity = s(idx_ser(k)).Solidity;
        m.ser(k).Eccentricity = s(idx_ser(k)).Eccentricity;
    end
    X_ser = [m.ser.Circularity; m.ser.Solidity; m.ser.Eccentricity]';
    
    Y = [s.Circularity; s.Solidity;s.Eccentricity]';
    
    dist_pa = mahal(Y,X_pa);
    dist_ser = mahal(Y, X_ser);
    
        % Calcular as distâncias para classificação
    
        classes = fields(m);
    
        for k = 1:size(s,1) %cycle all objects
            v_k = [s(k).Circularity s(k).Solidity s(k).Eccentricity]; % calcular o vetor de descritores
            for class_idx = 1:size(classes,1) % cycle all classes
                class = classes{class_idx};
    
                X = [m.(class).Circularity; m.(class).Solidity; m.(class).Eccentricity]';
                nome_distancia = ['dist_' class];
    
                Y = [s(k).Circularity; s(k).Solidity;s(k).Eccentricity]';
                s(k).(nome_distancia) = sqrt(mahal(Y,X));
    
            end
        end
    
    for k = 1:size(s,1)
        s(k).dist_pa = dist_pa(k);
        s(k).dist_ser = dist_ser(k);
    end
    
    % fazer a tabela
    PattAMaha = [s.dist_pa]/max([s.dist_pa]);
    PattBMaha = [s.dist_ser]/max([s.dist_ser]);
    T = [(1:numObj)' [s.Circularity]' [s.Solidity]' [s.Eccentricity]' [PattAMaha]' [PattBMaha]']
    
end
