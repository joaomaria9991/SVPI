close all
clc
clear all




NumMec=89132;
NumSeq='29x';

addpath('../')
addpath(strcat('Seq',NumSeq))



% match_cookie_rgb=imread('svpi2022_TP2_img_001_01.png');
% match_cookie_full=im2double(imread('svpi2022_TP2_img_001_01.png'));
% match_cookie_full_mask=(rgb2gray(match_cookie_full)<1);
% match_cookie_full=match_cookie_full_mask.*match_cookie_full;
% match_cookie_full_mask=bwmorph(match_cookie_full_mask,'close',Inf);
% match_cookie_rgb=bsxfun(@times, match_cookie_rgb, cast(match_cookie_full_mask,class(match_cookie_rgb)));
% 

% 
% [L_match Num_match]=bwlabel(match_cookie_full_mask);
% 
% props=regionprops(L_match,"all");
% 
% for i=1:Num_match
% 
%     sub_image(i)=rectangle("Position",props(i).BoundingBox);
%     sub_images{i}=imcrop(match_cookie_full, sub_image(i).Position);
%     sub_images_ref_gray{i}=rgb2gray(sub_images{i});
% 
%     sub_images_mask{i}=imcrop(match_cookie_full_mask, sub_image(i).Position);
%     rgb_ref_cookie{i}=imcrop(match_cookie_rgb, sub_image(i).Position);
%     Banana=sub_images_mask{i};
% 
% 
% 
%     moments=invmoments(sub_images_ref_gray{i});
%     full_moments(:,i)=invmoments(sub_images_ref_gray{i});
%     props_inv=regionprops(sub_images_mask{i},'Eccentricity','Solidity','Circularity','MajorAxisLength','MinorAxisLength');
%     sol=props_inv.Solidity;
%     ecc=props_inv.Eccentricity;
%     cc=props_inv.Circularity;
%     aspectRatio(i)=(props_inv.MajorAxisLength)/(props_inv.MinorAxisLength);
% 
% 
% 
% 
%     full_color=rgb_ref_cookie{i};
%     R=full_color(:,:,1);
%     G=full_color(:,:,2);
%     B=full_color(:,:,3);
% 
% 
%     R=sum(sum(R))/nnz(R);
%     G=sum(sum(G))/nnz(G);
%     B=sum(sum(B))/nnz(B);
% 
%     R=R/255;
%     G=G/255;
%     B=B/255;
% 
% 
%     ref_vals(:,i)=[abs(log(moments)) cc ecc sol R G B];
%     check_broken_ref(:,i)=[(moments)   ecc sol];
% 
% end






listaF=dir("Seq291/svpi2022_TP2_img_*_*png");
ff=length(listaF);


%for j=1:30
j=13;
tic
NumImg=j;

img_path=listaF(NumImg).name;
full_image=imread(img_path);
rgb_cookie=full_image;
full_image=im2double(full_image);



hsv = rgb2hsv(rgb_cookie);
med_color=floor(median(median(hsv(:,:,1)))*1000);


if med_color==541
    BW_image=createMask_lightBlue_2(full_image);
    BW_image=bwareaopen(BW_image,60);
    full_image=full_image(:,:,:).*BW_image;
elseif med_color==146
    BW_image=createMask_Beje2(full_image);
    BW_image=bwareaopen(BW_image,60);
    full_image=full_image(:,:,:).*BW_image;
elseif med_color==238
    BW_image=createMask_Green(full_image);
    BW_image=bwareaopen(BW_image,60);
    full_image=full_image(:,:,:).*BW_image;
elseif med_color==0
    BW_image=createMask_Black_Noise3(full_image);
    BW_image=bwareaopen(BW_image,60);
    full_image=full_image(:,:,:).*BW_image;
elseif med_color==558
    BW_image=createMask_Blue_texture(full_image);
    BW_image=bwareaopen(BW_image,60);
    full_image=full_image(:,:,:).*BW_image;
elseif med_color==621
    BW_image=createMask_Blue(full_image);
    BW_image=bwareaopen(BW_image,60);
    full_image=full_image(:,:,:).*BW_image;
else
    BW_image=black_6(full_image);
    BW_image=~imfill(BW_image,100);
    BW_image=bwareaopen(BW_image,60);
    BW_image=imfill(BW_image,'holes');
    full_image=full_image(:,:,:).*BW_image;
    'negroo'
end




% %full_image=cat(3,R, G, B);
% 
% 
imshow(BW_image)


function [BW,maskedRGBImage] = createMask_Blue(RGB)
I = rgb2hsv(RGB);
channel1Min = 0.473;
channel1Max = 0.751;
channel2Min = 0.000;
channel2Max = 1.000;
channel3Min = 0.000;
channel3Max = 1.000;
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;
BW = ~BW;
maskedRGBImage = RGB;
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
function [BW,maskedRGBImage] = createMask_Beje(RGB)
I = rgb2hsv(RGB);
channel1Min = 0.903;
channel1Max = 0.128;
channel2Min = 0.000;
channel2Max = 1.000;
channel3Min = 0.000;
channel3Max = 1.000;
sliderBW = ( (I(:,:,1) >= channel1Min) | (I(:,:,1) <= channel1Max) ) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;
maskedRGBImage = RGB;
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;
end
function [BW,maskedRGBImage] = createMask_lightBlue(RGB)
I = rgb2hsv(RGB);
channel1Min = 0.479;
channel1Max = 0.568;
channel2Min = 0.000;
channel2Max = 1.000;
channel3Min = 0.000;
channel3Max = 1.000;
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;
BW = ~BW;
maskedRGBImage = RGB;
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
function [BW,maskedRGBImage] = createMask_Green(RGB)
I = rgb2hsv(RGB);
channel1Min = 0.208;
channel1Max = 0.284;
channel2Min = 0.000;
channel2Max = 1.000;
channel3Min = 0.000;
channel3Max = 1.000;
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;
BW = ~BW;
maskedRGBImage = RGB;
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;
end
function [BW,maskedRGBImage] = createMask_Black_Noise(RGB)



% Convert RGB image to chosen color space
I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.000;
channel1Max = 0.000;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.000;
channel2Max = 0.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 0.200;

% Create mask based on chosen histogram thresholds
sliderBW = ( (I(:,:,1) >= channel1Min) | (I(:,:,1) <= channel1Max) ) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Invert mask
BW = ~BW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
function [BW,maskedRGBImage] = createMask_Black_Noise2(RGB)



% Convert RGB image to chosen color space
I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.000;
channel1Max = 0.000;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.000;
channel2Max = 0.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 0.133;

% Create mask based on chosen histogram thresholds
sliderBW = ( (I(:,:,1) >= channel1Min) | (I(:,:,1) <= channel1Max) ) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Invert mask
BW = ~BW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
function [BW,maskedRGBImage] = createMask_Black_Noise3(RGB)


% Convert RGB image to chosen color space
I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.000;
channel1Max = 0.000;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.000;
channel2Max = 0.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 0.192;

% Create mask based on chosen histogram thresholds
sliderBW = ( (I(:,:,1) >= channel1Min) | (I(:,:,1) <= channel1Max) ) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Invert mask
BW = ~BW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
function [BW,maskedRGBImage] = createMask_Particles(RGB)
%------------------------------------------------------


% Convert RGB image to chosen color space
I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.000;
channel1Max = 0.144;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.154;
channel2Max = 1.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.012;
channel3Max = 0.278;

% Create mask based on chosen histogram thresholds
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Invert mask
BW = ~BW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
function [BW,maskedRGBImage] = createMask_Black_Noise4(RGB)

I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.000;
channel1Max = 0.000;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.000;
channel2Max = 0.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 0.145;

% Create mask based on chosen histogram thresholds
sliderBW = ( (I(:,:,1) >= channel1Min) | (I(:,:,1) <= channel1Max) ) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Invert mask
BW = ~BW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
function [BW,maskedRGBImage] = createMask_Blue_texture(RGB)
%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder app. The colorspace and
%  range for each channel of the colorspace were set within the app. The
%  segmentation mask is returned in BW, and a composite of the mask and
%  original RGB images is returned in maskedRGBImage.

% Auto-generated by colorThresholder app on 05-Jun-2022
%------------------------------------------------------


% Convert RGB image to chosen color space
I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.523;
channel1Max = 0.600;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.570;
channel2Max = 1.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.231;
channel3Max = 0.996;

% Create mask based on chosen histogram thresholds
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Invert mask
BW = ~BW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
function [BW,maskedRGBImage] = createMask_lightBlue_2(RGB)

%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder app. The colorspace and
%  range for each channel of the colorspace were set within the app. The
%  segmentation mask is returned in BW, and a composite of the mask and
%  original RGB images is returned in maskedRGBImage.

% Auto-generated by colorThresholder app on 04-Jun-2022
%------------------------------------------------------


% Convert RGB image to chosen color space
I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.445;
channel1Max = 0.566;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.090;
channel2Max = 0.799;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.568;
channel3Max = 1.000;

% Create mask based on chosen histogram thresholds
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Invert mask
BW = ~BW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
function [BW,maskedRGBImage] = createMask_Beje2(RGB)

I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.133;
channel1Max = 0.182;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.078;
channel2Max = 0.158;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.902;
channel3Max = 1.000;

% Create mask based on chosen histogram thresholds
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Invert mask
BW = ~BW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end

function [BW,maskedRGBImage] = createMask_Fundo_Horrivel(RGB)
%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder app. The colorspace and
%  range for each channel of the colorspace were set within the app. The
%  segmentation mask is returned in BW, and a composite of the mask and
%  original RGB images is returned in maskedRGBImage.

% Auto-generated by colorThresholder app on 05-Jun-2022
%------------------------------------------------------


% Convert RGB image to chosen color space
I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.000;
channel1Max = 0.958;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.000;
channel2Max = 1.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 0.173;

% Create mask based on chosen histogram thresholds
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Invert mask
BW = BW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end


function [BW,maskedRGBImage] = black_6(RGB)
%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder app. The colorspace and
%  range for each channel of the colorspace were set within the app. The
%  segmentation mask is returned in BW, and a composite of the mask and
%  original RGB images is returned in maskedRGBImage.

% Auto-generated by colorThresholder app on 04-Jun-2022
%------------------------------------------------------


% Convert RGB image to chosen color space
I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.000;
channel1Max = 1.000;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.260;
channel2Max = 1.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 0.215;

% Create mask based on chosen histogram thresholds
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Invert mask
BW = ~BW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end





