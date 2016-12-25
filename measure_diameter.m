clear all; close all;

imPath = 'C:\MMU\HMC data\REPORT 130212 filter focus\Original images\';
imName = 'Well02_Run184_0.jpg';

inFile = strcat(imPath, imName);
I = imread(inFile);
imshow(I); hold on;
S = size(I);
n= 1;

 masks = false(S(1), S(2),n);
if 1 == 1 %Draw user initiated circles
    for i = 1:n
maskOut = mask(S(2), S(1),i);
masks(:,:,i) = maskOut(:,:);
if mod(i,3) == 1
    color = 'b';
elseif mod(i,3) == 2
    color = 'g';
else
    color = 'r';
end;
contour(maskOut, 'Color', color, 'lineWidth', 2);
    end;
end;

%Results:
%Image 0 has radius 191 pxl
%Image 1 has radius 194 pxl
%Image 2 has radius 189 pxl
%Image 3 has radius 192 pxl
%Image 4 has radius 178 pxl
%Image 5 has radius 151 pxl
%Image 6 has radius 138 pxl
