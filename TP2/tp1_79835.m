function [NumMec] = tp1_79835( )
%% Trabalho1
clc % Clear all text from command window
close all % Close all figures previously opened
clear % Clear previous environment variables
%addpath('../lib') % Update yout matlab path (the folder must exist)

NumMec=79835;
addpath('../')
listaF=dir('../svpi2019_TP1_img_*.png');

num_img=size(listaF,1);
% num_img=31
% fico só com os objetos
    
% %     h=(sprintf('svpi2019_TP1_img_130_04.png'));
for j=1:num_img
    img_path=listaF(j).name;
    NumSeq=str2double(img_path([18 19 20]));
    NumImg=str2double(img_path([22 23]));
    A=imread(img_path);
%     h=(sprintf('svpi2019_TP1_img_200_05.png'));
%     A=(imread(h));
    A=im2double(A);
    B=imbinarize(A,0.1);
    C=imfill(~B,'holes');
    imag=A.*C;
%     imshow(imag);
    [L, num]=bwlabel(C);

% separo as imagens
tam=size(A);
dados=zeros(tam(1),tam(2));
dad=zeros(tam(1),tam(2));
domino=zeros(tam(1),tam(2));
dom=zeros(tam(1),tam(2));
cartas=zeros(tam(1),tam(2));
car=zeros(tam(1),tam(2));
pntDad=0;
pntDom=0;
pntcart=0;
RF0=0;
RF1=0;
RD1=0;
RD0=0;
RD2=0;
tDuplas=0;
contdom=1;
contcar=0;
CopOuros=0;
EspPaus=0;
Ouros=0;
tDom=0;
tDice=0;
    for i=1:num
       imag_anal=(L==i);
       imag_an=A.*imag_anal;
       imag_anal1=regionprops(imag_an,'ALL');
       G=[imag_anal1.BoundingBox];
       imag_anali=imag_an(G(2)+0.5:G(4)+0.5+G(2)-1,G(1)+0.5:G(1)+0.5+G(3)-1); %imagens separadas
%        separação dos dados
       if G(3)==G(4)
           Gdad=G;
        %rotação dos dados/imagens com 45º
        if imag_anali(1,1)==0
           imag_rot=imrotate(imag_anali, -(pi/4)*180/pi);
           imag_anal1=regionprops(imag_rot,'ALL');
           Gdad=[imag_anal1.BoundingBox];
           imag_rot=imag_rot(Gdad(2)+0.5:Gdad(4)+0.5+Gdad(2)-1,Gdad(1)+0.5:Gdad(1)+0.5+Gdad(3)-1);          
           imag_anali=imag_rot;
           RF1=RF1+1;
        end
           dados=dados+imag_an;
           imag_anali=imag_anali(3:Gdad(4)-3,3:Gdad(3)-3);
           imag_anali=imadjust(imag_anali,[min(min(imag_anali)) max(max(imag_anali))],[0 1]);
           imag_anali=medfilt2(imag_anali);        
           imag_dado=imbinarize(imag_anali);
           imag_dado=bwmorph(imag_dado,'spur');
           if nnz(imag_dado)<0.5*numel(imag_dado)
              imag_dado=bwareaopen(imag_dado,10,8);                                    
              imag_dado=~imag_dado;
           else
              imag_dado=~bwareaopen(~imag_dado,14,8);
           end
           imag_dado=bwmorph(imag_dado,'diag');
           imag_ponto=regionprops(imag_dado,'ALL');
           Eudad=[imag_ponto.EulerNumber];
           Eudad=min(min(Eudad));
           imag_dado=~imag_dado;
%            imshow(imag_dado)
           if Eudad<=-6 || any(imag_dado(1,:))==1 || any(imag_dado(end,:))==1 || any(imag_dado(:,1))==1 || any(imag_dado(:,end))==1
               dados=dados-imag_an;
               pntDad=pntDad+Eudad-1;
           elseif imag_dado(:,:)==0 
               dados=dados-imag_an;
               pntDad=pntDad+Eudad-1; 
           else
               ima=regionprops(imag_dado,'ALL');
               ima1=ima.Area;
               if ima1<24
                  dados=dados-imag_an;
                  pntDad=pntDad+Eudad-1; 
               end
           end
           pntDad=pntDad-Eudad+1;
           dad=dad+imag_anal;
           dados1=imreconstruct(dados,dad);
           [Ldado, tDice]=bwlabel(dados1);
           RF0=tDice-RF1;
      end
%        figure(2)
%        imshow(dados)
       %rotação dos dominos e cartas de 90º
       if G(3)>G(4) %G(4) é na vertical
           imag_rot=imrotate(imag_anali, -(pi/2)*180/pi);
           imag_anal1=regionprops(imag_rot,'ALL');
           G=[imag_anal1.BoundingBox];
           imag_rot=imag_rot(G(2)+0.5:G(4)+0.5+G(2)-1,G(1)+0.5:G(1)+0.5+G(3)-1);          
           imag_anali=imag_rot;
           RD1=RD1+1;
           if (G(4)-1)/2==G(3) || (G(4))/2==(G(3)+1) || (G(4))/2==(G(3)-1) || (G(4)+1)/2==(G(3))
               RD0=RD0+1;
           end
       end
%        separação dos dominos
       if G(3)<G(4)
           Gdom=G;
           if (Gdom(4)-1)/2==Gdom(3) || (Gdom(4))/2==(Gdom(3)+1) || (Gdom(4))/2==(Gdom(3)-1) || (Gdom(4)+1)/2==(Gdom(3))
               domino=domino+imag_an;
               imag_anali=imag_anali(2:Gdom(4)-1,2:Gdom(3)-1);
               imag_anali=imadjust(imag_anali,[min(min(imag_anali)) max(max(imag_anali))],[0 1]);
               imag_anali=medfilt2(imag_anali);
               imag_dom=imbinarize(imag_anali);
               imag_dom=bwmorph(imag_dom,'spur');
               if nnz(imag_dom)<0.5*numel(imag_dom)
                   imag_dom=bwareaopen(imag_dom,10,4);                      
                   imag_dom=~imag_dom;
               else
                   imag_dom=~bwareaopen(~imag_dom,10,4);
               end
               imag_dom=~bwmorph(~imag_dom,'diag');
               imag_dom((Gdom(4)-3)/2:(Gdom(4)+2)/2,3:Gdom(3)-3)=0;
               imag_dom((Gdom(4)-3)/2:(Gdom(4)+2)/2,1:3)=1;
               imag_dom((Gdom(4)-3)/2:(Gdom(4)+2)/2,Gdom(3)-3:Gdom(3)-3)=1;
%                imshow(imag_dom)
               imag_pontodom=regionprops(imag_dom,'ALL');
               Eudom=[imag_pontodom.EulerNumber];
               Eudom=min(min(Eudom));
               if Eudom<=-13
                   domino=domino-imag_an;
                   pntDom=pntDom+Eudom;
               end
               pntDom=pntDom-Eudom;
               dom=dom+imag_anal;
               [Ldom, tDom]=bwlabel(dom);
  
               imag_dom((Gdom(4)-3)/2:(Gdom(4)+2)/2,1:end)=0;
               imag_dom=imag_dom;
               imag_duplas=regionprops(imag_dom,'ALL');
               Euduplas(contdom,:)=[imag_duplas.EulerNumber];
               contdom=contdom+1;
               if Euduplas(contdom-1,1)==Euduplas(contdom-1,2)
                  tDuplas=tDuplas+1;
               end
           else  
               cartas=cartas+imag_an;
               imag_anali=imag_anali(2:G(4)-1,2:G(3)-1);
               imag_anali1=imadjust(imag_anali,[min(min(imag_anali)) max(max(imag_anali))],[0 1]);
               imag_cart=imbinarize(imag_anali1);
               imag_cart=bwmorph(imag_cart,'spur');
               imag_cart(1,:)=1; imag_cart(end,:)=1; imag_cart(:,1)=1; imag_cart(:,end)=1;
                    if nnz(imag_cart)<0.5*numel(imag_cart)
                        imag_cart=bwareaopen(imag_cart,10,8);                      
                        imag_cart=~imag_cart;
                    else
                        imag_cart=~bwareaopen(~imag_cart,17,8);
                    end
                    imag_cart=~bwmorph(~imag_cart,'diag');
%                     figure(5)
%                imshow(imag_cart)
               imag_pontocart=regionprops(imag_cart,'ALL');
               Eucart=[imag_pontocart.EulerNumber];
               Eucart=min(min(Eucart));
               im=imag_pontocart.Image;
               if   imag_cart(:,:)==1 
                    continue
               end
                    if Eucart<=-13 || Eucart>-3 || nnz(~imag_cart)<200 || any(~im(1,:))==1 || any(~im(end,:))==1 || any(~im(:,1))==1 || any(~im(:,end))==1
                        cartas=cartas-imag_an;
                    else
                        dist=regionprops(~imag_cart,'ALL');
                        ar=[dist.Area];
                        ar1=max(max(ar));
                        ext=[dist.Extent];
                        ext=max(ext(find(max(ar1)==ar)));
                        if ext>=0.495 && ext<=0.62
                            EspPaus=EspPaus+1;
                        else
                            CopOuros=CopOuros+1;
                            imag_ouros1=~imag_cart;
                            imag_ouros1=regionprops(imag_ouros1,'ALL');
                            area=[imag_ouros1.Area];
                            narea=find(area==max(area));
                            imag_ouros=imag_ouros1(narea).Image;
                            s=size(imag_ouros);
                            if any(imag_ouros(1,(s(2)/2)-1:(s(2)/2)+1))==1 && any(imag_ouros(end,(s(2)/2)-1:(s(2)/2)+1))==1 || ext<=0.50
                                Ouros=Ouros+1;
                            end       
                           
                        end
                        contcar=contcar+1;
                        pntcart(contcar,:)=-Eucart-3;
                        tCard=EspPaus+CopOuros;
                        StringPT=sort(pntcart);
                        
                    end
           end
       
       end
%        figure(3)
%        imshow(domino)
%        figure(4)
%        imshow(cartas)
%        
%        figure(5)
%        subplot(ceil(sqrt(num)),ceil(sqrt(num)),i), imshow(imag_anali)
    end
    
% %     Ficheiro txt
    strPT=mat2str(StringPT');
    strPT=strPT(~isspace(strPT));
    strPT=strPT(2:end-1);
    
    sequencia=[num2str(NumMec) ',' num2str(NumSeq) ',' num2str(NumImg) ',' num2str(tDom) ',' num2str(tDice) ',' num2str(tCard) ',' num2str(RD0) ',' num2str(RF0) ',' num2str(tDuplas) ',' num2str(pntDom) ',' num2str(pntDad) ',' num2str(CopOuros) ',' num2str(EspPaus) ',' num2str(Ouros) ',' strPT '\n'];
    %sequencia=string(sequencia);
    sequencia=char(sequencia);
    
    %ficheiro=fopen('tp1_79835.txt','at');
    ficheiro=fopen('tp1_79835.txt','a');
    fprintf(ficheiro,sequencia);
    fclose(ficheiro);
    
end
end
    