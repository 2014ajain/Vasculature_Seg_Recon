%% Load data from Roboflow for Vasculature Segmentation
train="/Users/aseemjain/Documents/Research/Otopathology/Vasculature/train/";
valid="/Users/aseemjain/Documents/Research/Otopathology/Vasculature/valid/";
test="/Users/aseemjain/Documents/Research/Otopathology/Vasculature/test/";

%% Create training patches  
fileoutdata="/Users/aseemjain/Documents/Research/Otopathology/imagesTr/";
fileoutlabel="/Users/aseemjain/Documents/Research/Otopathology/labelsTr/";
data = dir(fullfile(train, '**','*.jpg')); 
label= dir(fullfile(train, '**','*.png')); 
count=0;
for k = 1:length(data)
    colorimage=imread(train+data(k).name);
    labelimage=imread(train+label(k).name);
    for i=1:3
        for j=0:3
           datapatch=colorimage(i*512+1:i*512+512,j*512+1:j*512+512,:);
           labelpatch=labelimage(i*512+1:i*512+512,j*512+1:j*512+512);
            if(max(labelpatch(:))~=0)
               dataname="vas_"+count+"_0000.png"; 
               labelname="vas_"+count+".png"; 
               imwrite(datapatch,fileoutdata+dataname)
               imwrite(uint8(labelpatch),fileoutlabel+labelname)
               count=count+1; 
            end
        end
    end

end
%% Create testing patches
fileoutdata="/Users/aseemjain/Documents/Research/Otopathology/imagesTs/";
fileoutlabel="/Users/aseemjain/Documents/Research/Otopathology/labelsTs/";
data = dir(fullfile(test, '**','*.jpg')); 
label= dir(fullfile(test, '**','*.png')); 
for k = 1:length(data)
    colorimage=imread(test+data(k).name);
    labelimage=imread(test+label(k).name);
    for i=1:3
        for j=0:3
           datapatch=colorimage(i*512+1:i*512+512,j*512+1:j*512+512,:);
           labelpatch=labelimage(i*512+1:i*512+512,j*512+1:j*512+512);
           if(max(labelpatch(:))~=0)
               dataname="vas_"+count+"_0000.png"; 
               labelname="vas_"+count+".png"; 
               imwrite(datapatch,fileoutdata+dataname)
               imwrite(uint8(labelpatch),fileoutlabel+labelname)
               count=count+1; 
           end
        end
    end

end
