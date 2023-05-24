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
    %   'Ex1B'
    %   'Ex2'
       'Ex4'
    % 'Ex4'
    }; %Defines the exercise to be executed (one or more at a time).


%% Ex1 -------------------------------------------------------------------

exercise = 'Ex1'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars
    ARGB=im2double(imread('artemoderna2.png'));

    hf=figure;
    subplot(2,4,1);imshow(ARGB)

    R=ARGB(:,:,1);
    G=ARGB(:,:,2);
    B=ARGB(:,:,3);
    Mred = R==1 & G==0 &B==0;
    Mgreen = R==0 & G==1 & B==0;
    Mblue = R==0 & G==0 & B==1;


    subplot(2,4,2); imshow(Mred); title('Mred')
    subplot(2,4,3); imshow(Mgreen); title('Mgreen')
    subplot(2,4,4); imshow(Mblue); title('Mblue')
    
    Mred3=repmat(Mred,[1 1 3]);
    Mgreen3=repmat(Mgreen,[1 1 3]);
    Mblue3=repmat(Mblue,[1 1 3]);

    Apure_red=ARGB*0;
    Apure_red(Mred3)=ARGB(Mred3);

    subplot(2,4,7); imshow(Apure_red);title('Pure red')

    


end


%% Ex1B -------------------------------------------------------------------

exercise = 'Ex1B'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars
    ARGB=im2double(imread('artemoderna2.png'));

    hf=figure;
    subplot(3,1,1);imshow(ARGB)

    R=ARGB(:,:,1);
    G=ARGB(:,:,2);
    B=ARGB(:,:,3);
    Myellow = R==1 & G==1 &B==0;



    subplot(3,1,2); imshow(Myellow); title('Mred')
    
    Myellow3=repmat(Myellow,[1 1 3]);


    Apure_yellow=ARGB*0+1;
    Apure_yellow(Myellow3)=ARGB(Myellow3);


    Mzeros=not(Myellow);
    Mzeros3=repmat(Mzeros,[1 1 3]);
    Apure_yellow(Mzeros3)=1;

    subplot(3,1,3); imshow(Apure_yellow);title('Pure yellow')

    


end


%% Ex2 -------------------------------------------------------------------

exercise = 'Ex2'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars
    ARGB=im2double(imread('mongolia.jpg'));

    subplot(2,1,1)
    imshow(ARGB)
    

    R=ARGB(:,:,1);
    G=ARGB(:,:,2);
    B=ARGB(:,:,3);

    [cR xR]=imhist(R);
    [cG xG]=imhist(G);
    [cB xB]=imhist(B);

    x=xR;
    subplot(2,1,2)

    hold on
    plot(x,cR,'r-')
    plot(x,cG,'G-')
    plot(x,cB,'B-')
  


end





%% Ex4 -------------------------------------------------------------------

exercise = 'Ex4'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars
    ARGB=im2double(imread('artemoderna2.png'));

    subplot(2,1,1);imshow(ARGB);


    Ahsv=rgb2hsv(ARGB);


    H=Ahsv(:,:,1);
    S=Ahsv(:,:,2);
    V=Ahsv(:,:,3);

    M=H>=0.15 & H<=0.2 & S>0.1;

    subplot(2,1,2)
    imshow(M)







end


