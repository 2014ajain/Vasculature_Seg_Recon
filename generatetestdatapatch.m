%% Generate whole data set testing patches 
filedataorig="/Users/aseemjain/Documents/Research/Otopathology/Cochlea_image_new/";
fileoutdata="/Users/aseemjain/Documents/Research/Otopathology/Vasculardata/";
data= dir(fullfile(filedataorig, '**','*.png'));
%%
count=0; 
for k = 1:length(data)
    colorimage=imread(filedataorig+data(k).name);
    colorimage=imresize(colorimage,[2048,2048]);
    for i=1:3
        for j=0:3
           datapatch=colorimage(i*512+1:i*512+512,j*512+1:j*512+512,:);
           dataname="vas_"+count+"_0000.png"; 
           imwrite(datapatch,fileoutdata+dataname)
           count=count+1; 
           
        end
    end
end
%Run inference with this data
%% Restich patches together after inference
filedataorig="/Users/aseemjain/Documents/Research/Otopathology/vascularpatches/";
fileoutdata="/Users/aseemjain/Documents/Research/Otopathology/vascularimages/";

test= dir(fullfile(filedataorig, '**','*.png'));
count=0; 
imagecount=0;
for k = 1:110
    labelimage=zeros([2048,2048]);
    for i=1:3
        for j=0:3
           patch=imread(filedataorig+"vas_"+count+".png");
           labelimage(i*512+1:i*512+512,j*512+1:j*512+512)=patch; 
           count=count+1; 
        end
    end
    labelimage=imresize(labelimage,[512 512]);
    imwrite(labelimage,fileoutdata+data(imagecount+1).name)
    imagecount=imagecount+1;

end