%make mask

clear all; clc; close all;
p = 0.1;
niifiles = spm_select(1,'image','Select voxelwise NIfTI image');
imgA = niifiles(1,:);
inhdrA = spm_vol(imgA); %load input header
inimgA = spm_read_vols(inhdrA); %load input image
inimgA(isnan(inimgA)) = 0;
maxA = max(max(max(inimgA)));
upperA = maxA;
lowerA = maxA - (maxA*p);
inimgA(inimgA > lowerA) = 1;
inimgA(inimgA ~= 1) = 0;

outimg = inimgA;
outhdr = inhdrA;

[pth,n,ext] = fileparts(inhdrA.fname);
outhdr.fname = fullfile(pth,['mask_' n ext]);
spm_write_vol(outhdr,outimg);