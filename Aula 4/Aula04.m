%% TemplateCodeSVPI -------------------------------------------------------
% Name:       João Machado
% Num. Mec:   89132
% Date:       2022

%% Initial configurations
clc % Clear all text from command window
close all % Close all figures previously opened
clear % Clear previous environment variables
%addpath('../lib') % Update yout matlab path (the folder must exist)

list_of_exercises = { %Add, comment or uncomment at will
    %   'Ex1'
    % 'Ex2'
    %  'Ex3'
    %   'Ex4'
    %'Ex5'
       'Ex6'
    }; %Defines the exercise to be executed (one or more at a time).



%% Ex1 -------------------------------------------------------------------

exercise = 'Ex1'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars

    A = zeros(200, 200);

    A((200/2)-25:(200/2)+25, (200/2)-40:(200/2)+40) = 1; % 50 * 80

    B = imnoise(A, 'salt & Pepper',0.05); % Noise

    F = ones(3,3)/9; % Filtro 3x3 com todos os valores 1/9
    C = filter2(F, B); % Filtro da média aplicando a matriz a cima

    D = medfilt2(B,[3,3]); % Aplicar á imagem com ruído a mediana para eliminar o ruído
    % [3,3] size dos vizinhos

    figure(1)
    subplot(141)
    imshow(A)
    title("Original")

    subplot(142)
    imshow(B)
    title("Ruido")

    subplot(143)
    imshow(C)
    title("Media")

    subplot(144)
    imshow(D)
    title("Mediana")

end



%% Ex2 -------------------------------------------------------------------

exercise = 'Ex2'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars

    rng(0)

    A = zeros(200, 200);

    A(75:125,60:140) = 1; % 50 * 80

    B = imnoise(A, 'salt & Pepper',0.01); % Noise

    F = -1*[1 1 1; 1 -8 1; 1 1 1]; % Filtro 3x3 com todos os valores 1/9
    R=filter2(F,B);
    C = filter2(F, B); % Filtro da média aplicando a matriz a cima

    Miso=abs(R)==8;


    D = medfilt2(B,[3,3]); % Aplicar á imagem com ruído a mediana para eliminar o ruído
    % [3,3] size dos vizinhos

    figure(1)
    subplot(1,3,3)
    imshow(Miso)
    title("Isolated Points")

    %Compute number of points
    npts=nnz(Miso);
    xlabel([num2str(npts) ' pontos isolados'])


    subplot(1,3,1)
    imshow(A)
    title("Original")

    subplot(1,3,2)
    imshow(B)
    title("Noisy")



end



%% Ex4 -------------------------------------------------------------------

exercise = 'Ex3'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars

    rng(0)
    lins=200;
    cols=200;

    A=zeros(lins,cols);
    A(lins/2-50/2:lins/2+50/2,cols/2-80/2:cols/2+80/2)=1;

    T=imnoise(A,'salt & pepper',0.005);

    F=zeros(3,3,4);
    F(:,:,1)=[1 1 1; 1 -8 1; 1 1 1];
    F(:,:,2)=[1 2 1; 2 -12 2; 1 2 1];
    F(:,:,3)=[-1 1 -1; 1 4 1; -1 1 -1];
    F(:,:,4)=[1 2 3; 4 -100 5; 6 7 8];

    W=[-8 -12 4 -100];
    Nw=[8 12 0 36];

    for n=1:4
        X=filter2(F(:,:,n),T);
        ZW=(X==W(n));
        ZB=(X==Nw(n));

        subplot(2,4,n),imshow(ZW)
        str=sprintf('Total %d',nnz(ZW));
        xlabel(str)

        subplot(2,4,4+n),imshow(ZB)
        str=sprintf('Total %d',nnz(ZB));
            xlabel(str)

    end


end

%% Ex4 -------------------------------------------------------------------

exercise = 'Ex4'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars

    A=[0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
        0 1 0 1 1 1 0 1 0 1 1 1 1 1 1 1 0 1 1 1 0
        0 1 0 1 0 1 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0
        0 1 1 1 0 1 0 1 1 1 0 1 0 1 0 1 1 1 1 1 0
        0 0 0 0 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0
        0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 1 1 0 1 0
        0 1 0 1 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0
        0 1 0 1 0 1 1 1 1 1 1 1 1 1 0 1 0 1 1 1 0
        0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 1 0 1 0 0 0
        0 1 0 1 1 1 0 1 1 1 0 1 0 1 0 1 1 1 0 1 0
        0 1 0 0 0 0 0 0 0 1 0 1 0 1 0 0 0 0 0 1 0
        0 1 0 1 1 1 1 1 1 1 0 1 0 1 1 1 0 1 1 1 0
        0 1 0 0 0 0 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0
        0 1 1 1 1 1 0 1 0 1 0 1 1 1 0 1 1 1 0 1 0
        0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 1 0 1 0
        0 1 1 1 0 1 0 1 1 1 1 1 0 1 1 1 1 1 0 1 0
        0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0
        0 1 0 1 1 1 0 1 1 1 0 1 0 1 1 1 1 1 0 1 0
        0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 1 0 1 0
        0 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

    figure;
    %Show maze
    subplot(2,1,1);
    imshow(A)
    vs_imgrid(A)
    title('Maze')

    %detect intersections
    F=[100 1 100; 1 -8 1; 100 1 100];
    R=filter2(F,A);
    Mint=R==-5;


    %Show intersections
    subplot(2,1,2);
    imshow(Mint)
    vs_imgrid(Mint)
    title('Intersections')


    [ys,xs]=find(Mint);

    hold on;
    subplot(2,1,1)
    plot(xs,ys,'r*')

end

%% Ex5 -------------------------------------------------------------------

exercise = 'Ex5'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars

    A=[0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
        0 1 0 1 1 1 0 1 0 1 1 1 1 1 1 1 0 1 1 1 0
        0 1 0 1 0 1 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0
        0 1 1 1 0 1 0 1 1 1 0 1 0 1 0 1 1 1 1 1 0
        0 0 0 0 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0
        0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 1 1 0 1 0
        0 1 0 1 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0
        0 1 0 1 0 1 1 1 1 1 1 1 1 1 0 1 0 1 1 1 0
        0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 1 0 1 0 0 0
        0 1 0 1 1 1 0 1 1 1 0 1 0 1 0 1 1 1 0 1 0
        0 1 0 0 0 0 0 0 0 1 0 1 0 1 0 0 0 0 0 1 0
        0 1 0 1 1 1 1 1 1 1 0 1 0 1 1 1 0 1 1 1 0
        0 1 0 0 0 0 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0
        0 1 1 1 1 1 0 1 0 1 0 1 1 1 0 1 1 1 0 1 0
        0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 1 0 1 0
        0 1 1 1 0 1 0 1 1 1 1 1 0 1 1 1 1 1 0 1 0
        0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0
        0 1 0 1 1 1 0 1 1 1 0 1 0 1 1 1 1 1 0 1 0
        0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 1 0 1 0
        0 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];


    figure;
    %Show maze
    subplot(2,1,1);
    imshow(A)
    vs_imgrid(A)
    title('Maze')

    Allwhite=A*0+1;

    %detect intersections
    F=[100 1 100; 1 -8 1; 100 1 100];


    for i=1:1000
        E=imnoise(Allwhite,'salt & pepper',0.01);

        %Show intersections
        subplot(2,1,2);
        imshow(E)
        vs_imgrid(E)
        title('Eliminate')
        
        %Step 2: delete black pixels in E from A
        A(E==0)=0;
        

        R=filter2(F,A);
        Mint=R==-5;
        n_intr=nnz(Mint);



        %Show A with deleted pixels

        subplot(2,1,1)
        imshow(A)
        vs_imgrid(A)
        title('Mazes')



        [ys,xs]=find(Mint);
        subplot(2,1,1)
        plot(xs,ys,'*r')

        pause(0.5)


        if n_intr==0
            disp('No more intersections')
            break;
        end

    end


end





%% Ex6 -------------------------------------------------------------------

exercise = 'Ex6'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars

    A=[0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
        0 1 0 1 1 1 0 1 0 1 1 1 1 1 1 1 0 1 1 1 0
        0 1 0 1 0 1 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0
        0 1 1 1 0 1 0 1 1 1 0 1 0 1 0 1 1 1 1 1 0
        0 0 0 0 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0
        0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 1 1 0 1 0
        0 1 0 1 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0
        0 1 0 1 0 1 1 1 1 1 1 1 1 1 0 1 0 1 1 1 0
        0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 1 0 1 0 0 0
        0 1 0 1 1 1 0 1 1 1 0 1 0 1 0 1 1 1 0 1 0
        0 1 0 0 0 0 0 0 0 1 0 1 0 1 0 0 0 0 0 1 0
        0 1 0 1 1 1 1 1 1 1 0 1 0 1 1 1 0 1 1 1 0
        0 1 0 0 0 0 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0
        0 1 1 1 1 1 0 1 0 1 0 1 1 1 0 1 1 1 0 1 0
        0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 1 0 1 0
        0 1 1 1 0 1 0 1 1 1 1 1 0 1 1 1 1 1 0 1 0
        0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0
        0 1 0 1 1 1 0 1 1 1 0 1 0 1 1 1 1 1 0 1 0
        0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 1 0 1 0
        0 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

    figure;
    %Show maze
    subplot(2,1,1);
    imshow(A)
    vs_imgrid(A)
    title('Maze')

    Allwhite=A*0+1;

    %detect intersections
    F=[0 1 0; 1 -8 1; 0 1 0];


    for i=1:1000
        E=imnoise(Allwhite,'salt & pepper',0.01);

        %Show intersections
        subplot(2,1,2);
        imshow(E)
        vs_imgrid(E)
        title('Eliminate')
        
        %Step 2: delete black pixels in E from A
        

        R=filter2(F,A);
        Mbecos=R==-7;
        Mbecos(1,:)=0;
        Mbecos(end,:)=0;
        Mbecos(:,1)=0;
        Mbecos(:,end)=0;
        A(Mbecos)=0;

        n_becos=nnz(Mbecos);



        %Show A with deleted pixels

        subplot(2,1,1)
        imshow(A)
        vs_imgrid(A)
        title('Mazes')



        [ys,xs]=find(Mbecos);
        subplot(2,1,1)
        plot(xs,ys,'*r')

        pause(0.1)


        if n_becos==0
            disp('No more dead ends')
            break;
        end

    end





end
