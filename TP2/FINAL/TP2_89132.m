function [NumMec] = tp2_89132( )
% close all
% clear all
% clc

%Os meus valores de referência, se quiser ver como calculei -> Scroll all
%the way down
M=[1.52387887257413	1.25890930385551	1.27514496312809	1.02810642512847	1.26516986668528	1.35986207672716	0.966039966273563	1.52808360742228	1.15786904086073	0.123936059753666	1.33017767348626	1.36128990174008	1.21829846631123	1.08791962668552	0.400071129084847	1.29509824265086	1.11139878321588	1.19304154207422	1.23505492824780	1.08971257051061	1.07500120962653	0.678928520011972	0.951180122749384	1.49486617821374	1.67657043456749	0.837978501068179	1.11407402328894	1.15508519329920;
    7.63180414728536	8.11740439373114	8.21886328650117	3.95409566737454	5.85177938414988	13.4240380807591	4.57443084523141	11.3305035240788	7.92558755039080	7.61241083662785	5.03646002799125	13.8604634208995	8.61916623450517	3.26005116731253	9.75123793417037	9.38770282771867	3.54244757441850	7.64212397733793	4.50487757638286	8.42099414813849	3.27152577708290	7.31821580601383	4.86422706692320	11.3356655212495	13.1559514954463	2.71181133304589	5.76160364722765	4.97101661785694;
    13.5348758858176	11.6786331032088	11.4609696427490	13.2547085973179	11.2144502003393	15.9110002327446	4.84174865402797	12.4251238725406	10.2193359732965	6.11299013337662	5.90942681354016	13.6953538344839	13.3052654666649	10.3127583424924	9.38641088474511	10.6082755951136	12.4112644510367	10.3376078589428	6.45912567727227	8.49619976096678	10.1480793485863	9.48351204238698	5.39431529594130	11.0597384992290	14.4618474088343	9.64212924749464	9.90556671261427	9.72636144163871;
    15.3288514204819	12.7634680767934	11.7464101050084	11.5037607577021	11.4912853890696	12.6149272465876	9.13149253947151	12.4507535959264	10.9525980438321	4.92730611639465	11.8742778755676	10.3524991900528	10.1261144743078	10.2647726259732	10.3789533630965	9.96901186981345	11.5188893229498	10.3056026282766	10.0807528609345	10.4802960408748	10.5793309229092	9.78229973554195	7.84312313796723	12.5899246321649	13.5539606429866	10.0667284967615	10.4762435745169	10.9003399803703;
    29.8806687619422	26.4722926909129	26.0152880819468	23.8863903277052	23.8033139107272	27.1600523869827	16.8443436228148	25.7578122850243	21.9582318275877	10.7723011851961	21.7917835126456	22.7080266081560	22.0687349324412	20.6733625919438	23.9022820248611	20.4999459597387	24.1091681091248	22.3610995337062	19.2366544463854	20.4225419176004	20.9434719706253	20.4798626885864	15.3741772149371	24.9149860629912	27.9271402490267	20.1406885649927	22.2733685524321	21.4570069201566;
    19.2458428446481	16.8231511151308	16.0079004886301	13.9199382163059	15.8901842888806	19.6081332672100	11.9704358173316	19.2302959452139	15.7363696974881	12.7165246934383	15.0737263456856	18.1054454133430	18.1273421718758	11.9385475334915	15.6889862078245	14.6707900608641	17.7591239186731	16.2464573776459	13.0878927280141	15.2273917317849	12.2182263477470	14.0569610473250	13.2725810415386	21.3921031491485	20.8236484346263	11.8943881782307	13.9318961165155	13.8689191690700;
    30.5332445988665	25.0230508784606	23.3525269837136	26.3808599230911	23.1378356496271	27.2984190413414	16.3927173141076	24.9853813199970	22.3284101799570	11.2637251334893	21.1144181323301	23.3865151760656	24.5615808207803	21.5566950955643	20.5040832009589	24.5589873659271	23.7668021539545	20.6430492329979	18.7829935909837	20.5018738751615	24.4657155296650	19.4785083855941	14.8850794164464	24.8110292204286	27.8904106494596	20.6785073196470	20.9366449974477	23.2938762201627;
    0.702188676817192	0.858236257188715	1.00059099485036	0.712347859187439	0.698925613161871	0.994023376778129	0.822301158515224	0.951488601124272	0.989452307631241	0.940193699162629	0.789726434757678	0.954603249222192	0.961558140739113	0.747939889216790	0.987727486319669	0.990396416130982	0.751545852450151	0.766352696668827	0.790851292947813	0.958539081802095	0.662332477427332	0.858962389466243	0.822689660471486	0.799812438413171	0.801270194268822	0.710752872960771	0.930378523627674	0.612610449668019;
    0.436399858608332	0.389652495594106	0.264797762827197	0.747227536160886	0.532692972433757	0.143225867541313	0.667330377112143	0.122398378773079	0.325471349775342	0.157148898751363	0.673961859816847	0.134418983523162	0.288867831579163	0.852707872064818	0.120942680950256	0.246768149311750	0.835126164631703	0.354520326855679	0.706232155356691	0.281742680666036	0.852180193706158	0.189627574806057	0.602596168243775	0.143327366405119	0.115267733343729	0.863162227984008	0.482997583017062	0.666640972643711;
    0.949258723814383	0.996773676864289	0.993749618879200	0.934038188417232	0.962713305398676	0.992515017139982	0.991633799450221	0.977049742710120	0.991478300924555	0.989425741312864	0.987297362690540	0.978634896335985	0.989308945707477	1	                0.991678761490082	0.989680325389089	0.995242796876403	0.941193469151857	0.925709887795196	0.985641097131705	0.965176765244196	0.965481543787001	0.953634460065809	0.968347882314905	0.974668806444507	0.965696784073507	0.979572341832611	0.922655443500357;
    0.909114628620881	0.829112349223239	0.681200161468570	0.782582290110390	0.824657669792196	0.775420578573963	0.668362767548866	0.799578391098021	0.656575531254514	0.157739298340661	0.806306897222803	0.716362184007143	0.737817569577144	0.727388640364935	0.263723864021167	0.753259116295115	0.704888521064992	0.836326986019052	0.776752526591523	0.698932907910875	0.802025657810407	0.545158878455551	0.661140274805029	0.739733067277861	0.903764067776009	0.651389588502702	0.504179554951528	0.800473531352467;
    0.710545561432385	0.495351678158064	0.543280615409420	0.447422557466981	0.512602055898370	0.554323337117096	0.391634112967834	0.713204330923058	0.458770042828308	0.129168388371009	0.655176821371852	0.614775460291234	0.474785922181373	0.610253680244901	0.232307185078474	0.536371143797510	0.594427821633704	0.528878072567682	0.617463361312669	0.417189535550439	0.531146617037953	0.338189171929327	0.354480035426969	0.695751164811021	0.841863827599872	0.432480322713714	0.474802943456281	0.499257470438042;
    0.388304270255300	0.231412880823130	0.317732966840588	0.101650450789091	0.0476692344263767	0.349560269622599	0.170640620851822	0.542375756524301	0.212767913016270	0.127828103053996	0.437622263707591	0.424036827299356	0.174658904497090	0.414108913880643	0.214930326376493	0.258954594676672	0.392858911241264	0.267786763387915	0.379644153640102	0.139487593537486	0.290616043812605	0.208035904349677	0.156343949122937	0.667279039424524	0.631852394861218	0.218817227705122	0.457847476249520	0.240435797350182];


N=[0.217865174618516	0.283963575634179	0.279390463970050	0.357683620429509	0.282191357158567	0.256696178889243	0.380587196011766	0.216951032535955	0.314154919398958	1.13194349193952	0.264430274877017	0.256329923201044	0.295732938619164	0.336916677597540	0.670272368479861	0.273870957200923	0.329098301788145	0.303297368038740	0.290818787762687	0.336313146131557	0.341297342458423	0.507160113254124	0.386284890773817	0.224278616087429	0.187014255097041	0.432584108469171	0.328219061437121	0.315030697255702;
    0.000484785444546372	0.000298301930816366	0.000269521259298704	0.0191760021951827	0.00287477926764993	1.47915721640716e-06	0.0103121667269378	1.20012046696338e-05	0.000361377459973631	0.000494278795490751	0.00649670581660445	9.56042545810442e-07	0.000180610778976860	0.0383864338366446	5.82225434239925e-05	8.37476181453818e-05	0.0289424016380937	0.000479808267131136	0.0110549434901889	0.000220195636898520	0.0379484819566486	0.000663344691620919	0.00771779122276985	1.19394141036548e-05	1.93393940000108e-06	0.0664163954835892	0.00314606237673287	0.00693609309316799;
    1.32396983251625e-06	8.47293914322803e-06	1.05332920774071e-05	1.75207703386105e-06	1.34780219839966e-05	1.23009994012011e-07	0.00789323943169228	4.01640283718793e-06	3.64584984410323e-05	0.00221392098667037	0.00271374192180682	1.12767357065775e-06	1.66569939334957e-06	3.32067183527118e-05	8.38558852145769e-05	2.47106657667954e-05	4.07245538777250e-06	3.23917156089358e-05	0.00156616444511877	0.000204243068537937	3.91512053273007e-05	7.60962141731763e-05	0.00454232948571184	1.57331831564234e-05	5.23961615152490e-07	6.49346455148012e-05	4.98961499938973e-05	5.96890816253803e-05;
    2.20173179550639e-07	2.86349378139853e-06	7.91769757200123e-06	1.00920683178575e-05	1.02187592050249e-05	3.32205414965776e-06	0.000108203965827774	3.91477149827850e-06	1.75124580132904e-05	0.00724599688505110	6.96733418956603e-06	3.19129335452311e-05	4.00206705207410e-05	3.48390168293086e-05	3.10797721648025e-05	4.68288135748894e-05	9.94053890520703e-06	3.34451883332480e-05	4.18778771996325e-05	2.80844071629430e-05	2.54363597095514e-05	5.64418453606718e-05	0.000392441475852612	3.40616125597887e-06	1.29894177660362e-06	4.24693254491472e-05	2.81984491978376e-05	1.84519596251928e-05;
    1.05436368942393e-13	-3.84127097398670e-12	5.03157488734295e-12	4.22933891184841e-11	4.59570472669229e-11	1.60154490489384e-12	-6.50060375463002e-08	6.50914968472922e-12	-3.64558534599830e-10	2.09724437314840e-05	-4.31332399621752e-10	-1.70948058189267e-10	-3.26046899069240e-10	1.05116938556441e-09	4.16265877229509e-11	-1.59276702306949e-09	-4.15715092671528e-11	1.94400717375425e-10	-5.72519315394995e-09	-1.72254980293441e-09	8.02353388859034e-10	1.27558276957462e-09	2.10416441539436e-07	-1.84468619674368e-11	7.43698823597507e-13	1.79064747433407e-09	-2.65156907831632e-10	-6.05010437707550e-10;
    4.38163960025140e-09	4.94081169692927e-08	1.11649594714597e-07	9.00839963306591e-07	-1.71869202107984e-07	-3.92921606594599e-09	-9.62802534790490e-06	-5.76221152735814e-09	-2.01074759052556e-07	3.00112093693811e-06	-3.95658573746088e-07	-1.80376719301976e-08	-1.76410548153204e-08	6.53363221994557e-06	1.53588911771768e-07	4.25164339807537e-07	-2.56418230606475e-08	-1.19515804707733e-07	-3.03515460663712e-06	2.43684438918889e-07	4.93959927859991e-06	-1.12086836937135e-06	-2.50952287847495e-06	-6.46038252967271e-10	-1.14793204880647e-09	6.82861847275276e-06	-1.27436038938445e-06	-1.35946892252882e-06;
    5.49010127786690e-14	1.35714760026061e-11	7.21317373224210e-11	3.49090562109430e-12	-1.10770010666228e-10	1.39459224434752e-12	7.59859551718926e-08	1.40924584970559e-11	-2.50817530771046e-10	-2.00608254021674e-05	-8.55450471064659e-10	-8.61833632705321e-11	2.15298489411396e-11	-5.47015230467164e-10	-1.58611254772574e-09	-2.64114933682013e-11	4.76660289091538e-11	1.08352173734547e-09	-9.06900897796211e-09	1.24781242951051e-09	2.36959840937838e-11	3.47209254584553e-09	-4.79857760442464e-07	1.67767147047034e-11	7.71522430645374e-13	-1.32949041707732e-09	-1.02394663116429e-09	-9.46292734910281e-11;
    0.436399858608332	0.389652495594106	0.264797762827197	0.747227536160886	0.532692972433757	0.143225867541313	0.667330377112143	0.122398378773079	0.325471349775342	0.157148898751363	0.673961859816847	0.134418983523162	0.288867831579163	0.852707872064818	0.120942680950256	0.246768149311750	0.835126164631703	0.354520326855679	0.706232155356691	0.281742680666036	0.852180193706158	0.189627574806057	0.602596168243775	0.143327366405119	0.115267733343729	0.863162227984008	0.482997583017062	0.666640972643711;
    0.949258723814383	0.996773676864289	0.993749618879200	0.934038188417232	0.962713305398676	0.992515017139982	0.991633799450221	0.977049742710120	0.991478300924555	0.989425741312864	0.987297362690540	0.978634896335985	0.989308945707477	1	0.991678761490082	0.989680325389089	0.995242796876403	0.941193469151857	0.925709887795196	0.985641097131705	0.965176765244196	0.965481543787001	0.953634460065809	0.968347882314905	0.974668806444507	0.965696784073507	0.979572341832611	0.922655443500357];

NumMec=89132;
NumSeq=291;
%SE N CORRER À PRIMEIRA COLOCAR NumSeq='29x', N SEI PQ DA ERRO
addpath('../')
addpath(strcat('Seq',NumSeq))






ref_vals=M;
check_broken_ref=N;
listaF=dir('../svpi2022_TP2_img_*png');
ff=length(listaF);


for j=1:ff


    NumImg=j;
    ObjBord=0;
    ObjPart=0;
    ObjOK=0;
    beurre=0;
    choco=0;
    confit=0;
    cracker=0;
    fan=0;
    ginger=0;
    lotus=0;
    maria=0;
    oreo=0;
    palmier=0;
    parijse=0;
    sugar=0;
    wafer=0;
    zebra=0;




    img_path=listaF(NumImg).name;
    full_image=imread(img_path);
    rgb_cookie=full_image;
    full_image=im2double(full_image);

    %%%major aix length minor axis length%%



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
        BW_image=createMask_Fundo_Horrivel(full_image);
        BW_image=~imfill(BW_image,100);
        BW_image=bwareaopen(BW_image,60);
        full_image=full_image(:,:,:).*BW_image;
    end





    [L num]=bwlabel(BW_image);
    total_cookies=num;
    BW_image_cleared=imclearborder(BW_image);
    [L NumClear]=bwlabel(BW_image_cleared);

    ObjBord=total_cookies-NumClear;

    props=regionprops(L,"all");


    num=NumClear;
    for i=1:num
        sub_image(i)=rectangle("Position",props(i).BoundingBox);
        sub_images{i}=imcrop(full_image, sub_image(i).Position);

        rgb_images{i}=imcrop(rgb_cookie, sub_image(i).Position);

        sub_images_mask{i}=imcrop(BW_image_cleared, sub_image(i).Position);
        sub_images_mask{i}=bwareafilt(sub_images_mask{i},1);

        full_color=rgb_images{i};

        R=full_color(:,:,1);
        G=full_color(:,:,2);
        B=full_color(:,:,3);


        R=sum(sum(R))/nnz(R);
        G=sum(sum(G))/nnz(G);
        B=sum(sum(B))/nnz(B);

        R=R/255;
        G=G/255;
        B=B/255;

        sub_images{i}=sub_images_mask{i}.*sub_images{i};
        sub_images_gray{i}=rgb2gray(sub_images{i});



        moments=invmoments(sub_images_gray{i});


        props_inv=regionprops(sub_images_mask{i},'Eccentricity','Solidity','Circularity');
        sol=props_inv.Solidity;
        ecc=props_inv.Eccentricity;
        cc=props_inv.Circularity;

        compare_cookie(:,i)=[abs(log(moments)) cc ecc sol R G B];
        check_broken(:,i)= [moments   ecc sol] ;




        min_dist=999999;

        for k=1:28 %Avanca nas bolachas
            vector=abs(ref_vals(:,k)-compare_cookie(:,i));
            dist=sum(vector.^2);
            if dist<min_dist
                min_dist=dist;
                vector_b=abs(check_broken_ref(:,k)-check_broken(:,i));
                norm_b=sum(vector_b.^2);
                rotulo=k;
            end

        end

        class(i)=rotulo;

        SS=ceil(sqrt(num));



        if  norm_b< 0.003
            if class(i)==1 ||class(i)==5
                subplot(SS,SS,i)
                title('Beurre')
                beurre=beurre+1;
            elseif class(i)==16 ||class(i)==9
                subplot(SS,SS,i)
                title('choco')
                choco=choco+1;
            elseif class(i)==22 ||class(i)==18
                subplot(SS,SS,i)
                title('confit')
                confit=confit+1;
            elseif class(i)==2 ||class(i)==25
                subplot(SS,SS,i)
                title('cracker')
                cracker=cracker+1;
            elseif class(i)==11 ||class(i)==7
                subplot(SS,SS,i)
                title('fan')
                fan=fan+1;
            elseif class(i)==20 ||class(i)==13
                subplot(SS,SS,i)
                title('ginger')
                ginger=ginger+1;
            elseif class(i)==21 ||class(i)==26
                subplot(SS,SS,i)
                title('lotus')
                lotus=lotus+1;
            elseif class(i)==3 ||class(i)==6
                subplot(SS,SS,i)
                title('maria')
                maria=maria+1;
            elseif class(i)==10 ||class(i)==15
                subplot(SS,SS,i)
                title('oreo')
                oreo=oreo+1;
            elseif class(i)==19 ||class(i)==23
                subplot(SS,SS,i)
                title('palmier')
                palmier=palmier+1;
            elseif class(i)==4 ||class(i)==28
                subplot(SS,SS,i)
                title('parijse')
                parijse=parijse+1;
            elseif class(i)==12 ||class(i)==8
                subplot(SS,SS,i)
                title('sugar')
                sugar=sugar+1;
            elseif class(i)==14 ||class(i)==17
                subplot(SS,SS,i)
                title('wafer')
                wafer=wafer+1;
            elseif class(i)==24 ||class(i)==27
                subplot(SS,SS,i)
                title('zebra')
                zebra=zebra+1;
            end
        else
            ObjPart=ObjPart+1;
        end
        ObjOK=total_cookies-(ObjPart+ObjBord);

    end
    ObjOk=total_cookies-(ObjBord+ObjPart);

    linha=[num2str(NumMec) ',' num2str(NumSeq) ',' num2str(NumImg) ',' num2str(ObjBord) ',' num2str(ObjPart) ','  num2str(ObjOK) ','  num2str(beurre) ',' num2str(choco)  ','  num2str(confit) ','  num2str(cracker) ','  num2str(fan) ','  num2str(ginger) ','  num2str(lotus) ','  num2str(maria) ','  num2str(oreo) ','  num2str(palmier) ','  num2str(parijse)  ','  num2str(sugar) ','  num2str(wafer) ','  num2str(zebra) '\n'];
    linha=char(linha);

    ficheiro=fopen('TP2_89132.txt','at');
    fprintf(ficheiro,linha);
    fclose(ficheiro);




end

close all


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



function phi = invmoments(F)
%INVMOMENTS Compute invariant moments of image.
%   PHI = INVMOMENTS(F) computes the moment invariants of the image
%   F. PHI is a seven-element row vector containing the moment
%   invariants as defined in equations (11.3-17) through (11.3-23) of
%   Gonzalez and Woods, Digital Image Processing, 2nd Ed.
%
%   F must be a 2-D, real, nonsparse, numeric or logical matrix.

%   Copyright 2002-2004 R. C. Gonzalez, R. E. Woods, & S. L. Eddins
%   Digital Image Processing Using MATLAB, Prentice-Hall, 2004
%   $Revision: 1.5 $  $Date: 2003/11/21 14:39:19 $

if (ndims(F) ~= 2) | issparse(F) | ~isreal(F) | ~(isnumeric(F) | ...
                                                    islogical(F))
   error(['F must be a 2-D, real, nonsparse, numeric or logical ' ...
          'matrix.']);
end

F = double(F);
phi = compute_phi(compute_eta(compute_m(F)));
end
%-------------------------------------------------------------------%
function m = compute_m(F)

[M, N] = size(F);
[x, y] = meshgrid(1:N, 1:M);
 
% Turn x, y, and F into column vectors to make the summations a bit
% easier to compute in the following.
x = x(:);
y = y(:);
F = F(:);
 
% DIP equation (11.3-12)
m.m00 = sum(F);
% Protect against divide-by-zero warnings.
if (m.m00 == 0)
   m.m00 = eps;
end
% The other central moments: 
m.m10 = sum(x .* F);
m.m01 = sum(y .* F);
m.m11 = sum(x .* y .* F);
m.m20 = sum(x.^2 .* F);
m.m02 = sum(y.^2 .* F);
m.m30 = sum(x.^3 .* F);
m.m03 = sum(y.^3 .* F);
m.m12 = sum(x .* y.^2 .* F);
m.m21 = sum(x.^2 .* y .* F);
end
%-------------------------------------------------------------------%
function e = compute_eta(m)

% DIP equations (11.3-14) through (11.3-16).

xbar = m.m10 / m.m00;
ybar = m.m01 / m.m00;

e.eta11 = (m.m11 - ybar*m.m10) / m.m00^2;
e.eta20 = (m.m20 - xbar*m.m10) / m.m00^2;
e.eta02 = (m.m02 - ybar*m.m01) / m.m00^2;
e.eta30 = (m.m30 - 3 * xbar * m.m20 + 2 * xbar^2 * m.m10) / m.m00^2.5;
e.eta03 = (m.m03 - 3 * ybar * m.m02 + 2 * ybar^2 * m.m01) / m.m00^2.5;
e.eta21 = (m.m21 - 2 * xbar * m.m11 - ybar * m.m20 + ...
           2 * xbar^2 * m.m01) / m.m00^2.5;
e.eta12 = (m.m12 - 2 * ybar * m.m11 - xbar * m.m02 + ...
           2 * ybar^2 * m.m10) / m.m00^2.5;
end
%-------------------------------------------------------------------%
function phi = compute_phi(e)

% DIP equations (11.3-17) through (11.3-23).

phi(1) = e.eta20 + e.eta02;
phi(2) = (e.eta20 - e.eta02)^2 + 4*e.eta11^2;
phi(3) = (e.eta30 - 3*e.eta12)^2 + (3*e.eta21 - e.eta03)^2;
phi(4) = (e.eta30 + e.eta12)^2 + (e.eta21 + e.eta03)^2;
phi(5) = (e.eta30 - 3*e.eta12) * (e.eta30 + e.eta12) * ...
         ( (e.eta30 + e.eta12)^2 - 3*(e.eta21 + e.eta03)^2 ) + ...
         (3*e.eta21 - e.eta03) * (e.eta21 + e.eta03) * ...
         ( 3*(e.eta30 + e.eta12)^2 - (e.eta21 + e.eta03)^2 );
phi(6) = (e.eta20 - e.eta02) * ( (e.eta30 + e.eta12)^2 - ...
                                 (e.eta21 + e.eta03)^2 ) + ...
         4 * e.eta11 * (e.eta30 + e.eta12) * (e.eta21 + e.eta03);
phi(7) = (3*e.eta21 - e.eta03) * (e.eta30 + e.eta12) * ...
         ( (e.eta30 + e.eta12)^2 - 3*(e.eta21 + e.eta03)^2 ) + ...
         (3*e.eta12 - e.eta30) * (e.eta21 + e.eta03) * ...
         ( 3*(e.eta30 + e.eta12)^2 - (e.eta21 + e.eta03)^2 );

end
end