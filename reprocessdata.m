%% reprocess data
filedata="/Users/aseemjain/Documents/Research/Otopathology/datalabel/";
filelabel="/Users/aseemjain/Documents/Research/Otopathology/newlabel/";
data = dir(fullfile(filedata, '**','*.tiff')); 
label= [dir(fullfile(filelabel, '**','*.png'));dir(fullfile(filelabel, '**','*.tiff'))]; 
fileoutdata="/Users/aseemjain/Documents/Research/Otopathology/imagesTr/";
fileoutlabel="/Users/aseemjain/Documents/Research/Otopathology/labelsTr/";

%% Rename images according to nnUnet format
for i = 1:length(data)
    colorimage=imread(filedata+data(i).name);
    labelimage=imread(filelabel+label(i).name);
    %imshow(imoverlay(colorimage,labelimage));
    dataname="stria_"+i+"_0000.png";
    labelname="stria_"+i+".png";
    imwrite(colorimage,fileoutdata+dataname)
    imwrite(uint8(labelimage),fileoutlabel+labelname)

end

%% Compress images for training scala network 
filedataorig="/Users/aseemjain/Documents/Research/Otopathology/Cochlea_image_new/";
filedatacomp="/Users/aseemjain/Documents/Research/Otopathology/Cochlea_image_newcompressed/";

dataorg = dir(fullfile(filedataorig, '**','*.tiff')); 
for i = 24:length(dataorg)
    colorimage=imread(filedataorig+dataorg(i).name);
    if(size(colorimage,3)>3)
        colorimage=colorimage(:,:,1:3);
    end
    compressed=imresize(colorimage,[512 512]);
    %imshow(imoverlay(colorimage,labelimage));
    dataname="stria_"+i+"_0000.png";
    imwrite(colorimage,filedataorig+dataname)
    imwrite(compressed,filedatacomp+dataname)

end