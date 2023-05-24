%% TemplateCodeSVPI -------------------------------------------------------
% Name:       João Maria Machado
% Num. Mec:   89132
% Date:       2022

%% Initial configurations
clc % Clear all text from command window
close all % Close all figures previously opened
clear % Clear previous environment variables
%addpath('../lib') % Update yout matlab path (the folder must exist)

list_of_exercises = { %Add, comment or uncomment at will
    %  'Ex1'
    %   'Ex3'
    %   'Ex4'
    %   'Ex5'
    %   'Ex6'
    %   'Ex8'
    %   'Ex9'
    }; %Defines the exercise to be executed (one or more at a time).


%% Ex1 -------------------------------------------------------------------

exercise = 'Ex1'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars

    A=im2double(imread('matches1.png'));

    subplot(2,3,1);
    imshow(A)

    subplot(2,3,2)
    imhist(A)

    M=A<0.2; %compute the mask of the head of the matches

    subplot(2,3,4)
    imshow(M)

    %paint the head of the matches

    B=A;
    B(M)=1;


    subplot(2,4,5)
    imshow(B)

    %Ex2
    M= A>0.2 & A<0.6;
    subplot(2,3,4);
    imshow(M)

    C=A;
    C(M)=0.5;
    subplot(2,3,5)
    imshow(C)

end



%% Ex3 -------------------------------------------------------------------

exercise = 'Ex3'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars


    A=im2double(imread('trimodalchess.png'));

    T=multithresh(A,2);

    figure; imshow(A);
    figure; imhist(A);

    figure

    %Get black squares
    M=A<T(1);
    B=A;
    B(M)=1;
    B(~M)=0;
    subplot(2,3,3)
    imshow(B)
    title('Black')


    %Get black and white
    M=A<T(1) | A>T(2);
    C=A;
    C(M)=1;
    C(~M)=0;
    subplot(2,3,1)
    imshow(C)
    title('Black and Whithe')



    %Get gray
    M=A>T(2)|(A>T(1)& A<T(2));
    C=A;
    C(M)=1;
    C(~M)=0;
    subplot(2,3,2)
    imshow(C)
    title('Gray and White')

    img=A;

    % Brancos
    img1 = imbinarize(img, T(1));

    % Brancos e cinzentos
    img2 = imbinarize(img, T(2));

    % Pretos e Brancos
    PB = img < T(1) | img > T(2); % I menor que T(1) (mais Preto) ou
    % I maior que T(2) (mais Branco)
    % Cinzentos
    C = img > T(1) & img < T(2);

    % Pretos
    P = img < T(1);

    % Pretos e Cinzentos
    PC = img < T(2);


    subplot(2,3,2)
    imshow(PC)
    title('Gray and White')


end


%% Ex4 -------------------------------------------------------------------

exercise = 'Ex4'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars

    A=im2double(imread('seeds.png'));
    B=im2double(imread('seeds_inv.png'));

    Abin=autobin(A);
    Bbin=autobin(B);

    figure;
    subplot(2,2,1);
    imshow(A);title('seeds.png')

    subplot(2,2,2);
    imshow(Abin);

    subplot(2,2,3);
    imshow(B);

    subplot(2,2,4);
    imshow(Bbin);


end




%% Ex5 -------------------------------------------------------------------

exercise = 'Ex5'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars

    A=im2double(imread('rice.png'));
    [H,W]=size(A);
    Abin=autobin(A);

    figure;

    imshow(A),title('Original')


    %dissasemble into images

    A11=A(1:round(H/2),   1:round(W/2));

    A12=A(1:round(H/2),   round(W/2+1):W);

    A21=A(round(H/2+1):H,   1:round(W/2));

    A22=A(round(H/2+1):H, round(W/2+1):W);



    %Binarize sub images
    figure;
    subplot(2,2,1);imshow(A11);title('A11')
    subplot(2,2,2);imshow(A12);title('A12')
    subplot(2,2,3);imshow(A21);title('A21')
    subplot(2,2,4);imshow(A22);title('A22')



    A11bin=autobin(A11);
    A12bin=autobin(A12);
    A21bin=autobin(A21);
    A22bin=autobin(A22);


    figure;
    subplot(2,2,1);imshow(A11bin);title('A11bin')
    subplot(2,2,2);imshow(A12bin);title('A12bin')
    subplot(2,2,3);imshow(A21bin);title('A21bin')
    subplot(2,2,4);imshow(A22bin);title('A22bin')


    %Assembly the  binarized images;
    %option 1 concatenar matrizes


    Abin=[A11bin A12bin; A21bin A22bin];
    figure;
    imshow(Abin),title('Abin')

    %Option 2 usar os indices

    Abin=A;
    Abin(1:round(H/2),   1:round(W/2))=A11bin;

    Abin(1:round(H/2),   round(W/2+1):W)=A12bin;

    Abin(round(H/2+1):H,   1:round(W/2))=A21bin;

    Abin(round(H/2+1):H, round(W/2+1):W)=A22bin;


    figure;
    imshow(Abin);title('Abin2')


end




%% Ex6 -------------------------------------------------------------------

exercise = 'Ex6'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars

    A=im2double(imread('rice.png'));
    W=size(A,2);H=size(A,1);

    N=2;M=3;
    B=A;
    for n=1:N
        for m=1:M
            row_start=round(n-1)*H/N+1;
            row_end=round(n*H/N);
            col_start=round(m-1)*W/M+1;
            col_end=round(m*W/M);


            Ann=A(row_start:row_end,col_start:col_end);

            Annbin=autobin(Ann);

            B(row_start:row_end,col_start:col_end)=Annbin;

            imshow(B);
            pause(0.01)

        end
    end


hold on
rows=linspace(1,H,N+1);

for row=rows
    plot([1 W],[row row],'-r', 'LineWidth',4)

end

cols=linspace(1,W,M+1);
for col=cols
    plot([col col],[1 H],'-r', 'LineWidth',4)

end

end



%% Ex8 -------------------------------------------------------------------
exercise = 'Ex8'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
    img = im2double(imread('rice.png'));
    
    img_bin = imbinarize(img, 'adaptive');
    
    figure(1)
    subplot(1,3,1)
    imshow(img)
    title('Original')
    
    subplot(1,3,2)
    imshow(img_bin)
    title('Adaptive binarization')
    
    img_bin_clean = bwareaopen(img_bin,11);
    
    subplot(1,3,3)
    imshow(img_bin_clean)
    title('Cleaned Image')
  
end

%% Ex9 -------------------------------------------------------------------
exercise = 'Ex9'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  img = im2double(imread('samples2.png'));

  thresh = adaptthresh(img, 0.55, 'ForegroundPolarity', 'dark', 'Statistic', 'gaussian' );
  
  img_bin = imbinarize(img, thresh);
  
  img_bin = ~(img_bin);
  
  img_bin_clean = bwareaopen(img_bin,100);

  figure(1)
  
  subplot(1,2,1)
  imshow(img)
  
  subplot(1,2,2)
  imshow(img_bin_clean)

  
end



