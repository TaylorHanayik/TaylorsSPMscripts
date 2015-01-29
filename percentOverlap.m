
clear all; clc; close all;
niifiles = spm_select(2,'image','Select voxelwise NIfTI image');
imgA = niifiles(1,:);
imgB = niifiles(2,:);
inhdrA = spm_vol(imgA); %load input header
inimgA = spm_read_vols(inhdrA); %load input image
inhdrB = spm_vol(imgB); %load input header
inimgB = spm_read_vols(inhdrB); %load input image
inimgA(isnan(inimgA)) = 0;
inimgB(isnan(inimgB)) = 0;
inimgA(inimgA ~= 0) = 1;
inimgB(inimgB ~= 0) = 1;

overlapimg = inimgA+inimgB;
sum(overlapimg ~= 0)
totOverlap = overlapimg(overlapimg~=0);
Overlap = length(totOverlap(totOverlap==2))/length(totOverlap)

