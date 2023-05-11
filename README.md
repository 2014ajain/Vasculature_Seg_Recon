# Histology Vasculature Segmentation and 3D Reconstruction
CIS II Project

General Outline 
1. Train Scala Network 
2. Train Vasculature Network 
3. Compress images and run inference on to generate scala masks
4. Create patches and run inference to generate vasculature masks
5. Register histology images and use transforms to align segmentations
6. Use 3D slicer to visualize stack of masks as 3D model 

Code Structure 
reprocessdata.m: used to convert dataset into appropriate naming convention for training scala network 
generatepatches.m: used to take vasculature training data convert it into smaller 512 x 512 patches and save it in the appropriate naming convention
generatetestdatapatches.m: used to generate the patches for testing the vascular segmentation model, also used to restich together the patches into whole images 
setup_nnunet.ipynb:used to setup, train, run inference for nnUNet 
registeration.ipynb:used to register scala and vasculature labels for 3D reconstruction 

