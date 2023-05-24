close all
clear all
clc

NumMec=89132;
NumSeq=160;
NumImg=1;
tDom=0;
tDice=0;
tCard=0;
RDO=0;
RF0=0;
tDuplas=0;
PntDom=0;
PntDad=0;
CopOuros=0;
EspPaus=0;
Ouros=0;
String='';


sem_signi=0;

NumSeq_str=num2str(NumSeq);

if NumImg<10
    NumImg_str=strcat('0',num2str(NumImg));
else
    NumImg_str= num2str(NumImg);
end

a="Seq160/svpi2022_TP1_img_"+NumSeq_str+"_"+NumImg_str+".png";
fName=a;

Z=im2double(imread( fName ));
regions=vs_getsubimages(Z); %extract all regions
N=numel(regions);
SS=ceil(sqrt(N));





for k=1:N
    subplot( SS, SS, k)
    imshow( regions{k} )
    
    A=regions{k};
    A=imbinarize(A);
    
    
    [L,num]=bwlabel(A);
    
    
    Ln=~L;
    
    if nnz(L)>=nnz(Ln)
        L=~L;
    end
    
    
    if size(L,1)==size(L,2) && (num<=7 && num>=2)
        tDice=tDice+1;
        PntDad=PntDad+(num-1);
        imshow(L)
    
    
    %size(L,1) -> largura
    %size(L,2) -> comprimento
    
    
    
    
    if size(L,1)~=size(L,2)  &&   num<15
        c1=sum(sum((A(63:65,6:60))))/size(A(63:65,6:60),2);
        c2=sum(sum((A(6:60,63:65))))/size(A(6:60,63:65),2);
        
        if c1==1 || c2==1
            %Sou um dómino
            tDom=tDom+1;
        else
            %Sou uma carta
            tCard=tCard+1;
        end
    else
        
        sem_signi=sem_signi+1;
    end
    
    
    
    
    
    
end




figure(2)
imshow(L)
%
% for i=1:num
% figure()
% %subplot(2,num/2,i)
% imshow(L==i);
%
% end







