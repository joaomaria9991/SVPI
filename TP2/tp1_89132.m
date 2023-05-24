function [NumMec] = tp1_89132( )



close all
clc
clear all

NumMec=89132;
NumSeq=160;

addpath('../')
listaF=dir("Seq160/svpi2022_TP1_img_*_*png");
ff=length(dir([strcat('Seq',num2str(NumSeq))]));

for img=1:40
    NumImg=img;

    tDom=0;
    tDice=0;

    tCard=0;
    RD0=0;
    RF0=0;
    tDuplas=0;
    PntDom=0;
    PntDad=0;
    CopOuros=0;
    EspPaus=0;
    Ouros=0;
    String=[];

    NumSeq_str=num2str(NumSeq);

        if NumImg<10
            NumImg_str=strcat('0',num2str(NumImg));
        else
            NumImg_str= num2str(NumImg);
        end

        file="Seq"+NumSeq+"/svpi2022_TP1_img_"+NumSeq_str+"_"+NumImg_str+".png";
        fName=file;

        Z=im2double(imread( fName ));
        regions=vs_getsubimages(Z); %extract all regions
        N=numel(regions);
        SS=ceil(sqrt(N));

        for k=1:N

            c1=0;
            im=35;
            A=regions{k};
            B=A; %A imaculado
            A1 = A(3: end-2,3:end-2); %tirar as bordas para fazer o threshold
            T=graythresh(A1);

            A=imbinarize(A,T);
            A3= bwareaopen(A,80);
            A = A(3: end-2,3:end-2);




        AB=imbinarize(regions{k});
        AB = AB(3: end-2,3:end-2);
        if nnz(AB)>nnz(~AB)
            AB=~AB;
        end
        [L,num]=bwlabel(AB);



            if nnz(A)>nnz(~A)
                A=~A;
            end

            if size(A,1)~=size(A,2)


                if size(A,1)>size(A,2)

                    C=imresize(A,[125,61],'cubic');
                    c1=sum(C(63:63,4:58))/numel(C(63:63,4:58)); %vertical
                    Split_dom1=C(1:63,:);
                    Split_dom2=C(63:end,:);

                elseif size(A,1)<size(A,2)

                    C=imresize(A,[61,125],'cubic');
                    c1=sum(C(6:56,63:63))/numel(C(4:58,63:63)); %horizontal
                    RD0=RD0+1;
                    Split_dom1=C(:,1:63);
                    Split_dom2=C(:,63:end);

                end

                [lixo1, pintas_meio_domino1]=bwlabel(Split_dom1);
                [lixo2, pintas_meio_domino2]=bwlabel(Split_dom2);






                if c1>0.8
                    %title('domino')
                    tDom=tDom+1;
                    PntDom=PntDom+num-1; %retirar a divisoria

                    if pintas_meio_domino1==pintas_meio_domino2
                        tDuplas=tDuplas+1;
                    end


                elseif num>=4 && num<=14
                    % title('carta')
                    tCard=tCard+1;




                    if size(A,1)>size(A,2) %depois pode dar asneira quando vou buscar a região do naipe, logo rodo-a sempre
                        A=imrotate(A,90);
                        Arot=A;
                    end

                    A=imresize(A,[125,61],'cubic');
                    A = A(3: end-2,3:end-2);
                    [L,card_element]=bwlabel(A);
                    naipe=(L==2);
                    s=regionprops(naipe,'all');
                    ff=[s.Circularity];
                    ff=round(ff,2); %fator de forma de paus
                    paus=[0.4:0.01:0.5];
                    espadas=[0.75:0.01:0.89]; %Tolerãncia de fatores forma dos naipes
                    Nouros=[0.55:0.01:0.7];
                    copas=[0.9:0.01:1.1];

                    if  ismember(ff,paus)
                        EspPaus=EspPaus+1;
                    elseif  ismember(ff,espadas)
                        EspPaus=EspPaus+1;
                    elseif  ismember(ff,copas) | ff>copas(end)
                        CopOuros=CopOuros+1;
                    else
                        CopOuros=CopOuros+1;
                        Ouros=Ouros+1;
                    end
                    String(k)=num-4;

                else
                    %title('sem significado')

                end
            end


            A=regions{k};
            A1 = A(3: end-2,3:end-2);
            T=graythresh(A1);
            A=imbinarize(A,T);
            if nnz(A)>nnz(~A)
                A=~A;
            end
            rot=A;


            if size(A,1)==size(A,2)
                if nnz(rot(1,:))<20 %rodado, aplico este filtro para o bwlabel funcionar melhor
                    A=medfilt2(A);
                else
                    RF0=RF0+1;
                end
                A=regions{k};
                T=graythresh(A1);
                A1 = A(4: end-3,4:end-3);
                A=imbinarize(A,T);
                if nnz(A)>nnz(~A)
                    A=~A;
                end
                [L,num]=bwlabel(A);

                if (num<=8 && num>=1)
                    %title('dado')
                    tDice=tDice+1;
                    PntDad=PntDad+num-1;

                else
                    %title('sem significado')
                end

            end

        end

        String=num2str(sort(String(String>0)));
        String=String(find(~isspace(String)));

        %Guardar tudo conforme formato
        linha=[num2str(NumMec) ',' num2str(NumSeq) ',' num2str(NumImg) ',' num2str(tDom) ',' num2str(tDice) ',' num2str(tCard) ',' num2str(RD0) ',' num2str(RF0) ',' num2str(tDuplas) ',' num2str(PntDom) ',' num2str(PntDad) ',' num2str(CopOuros) ',' num2str(EspPaus) ',' num2str(Ouros) ',' String '\n'];
        linha=char(linha);

        ficheiro=fopen('../TP3_89132.txt','at');
        fprintf(ficheiro,linha);
        fclose(ficheiro);




    end


end



