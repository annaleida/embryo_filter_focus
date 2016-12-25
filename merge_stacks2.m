clear all; close all; clf;
pause on;
Itotal = 0;
for focus = 3:-1:3

    
filename = strcat('C:\\MMU\\HMC data\\REPORT 130212 filter focus\\\Original images\\Well02_Run184_', num2str(focus), '.jpg');

Iorg = imread(filename);
I = imresize(Iorg, 0.5);
csize = size(I);

 se = strel('ball',7,7);
 
gauss = smoothts(I, 'g', 100, 2);
%gauss = I;
laplace = del2(double(gauss), 1); %#2 is spacing between points

Hmax = imhmax(laplace, 0.15*max(max(laplace)),8);
 Iopen = imopen(Hmax,se);
 Iclose = imclose(Hmax, se);
 
  Imask = zeros(size(Iclose));
Imask(Iclose>0.99) = 1;
Imask = imfill(Imask);

Imask2 = imresize(Imask,2); Imask2 = imfill(Imask2);
Inew = Iorg;
 Inew(Imask2<1) = 0;
 
figure(1); imshow(I); title('Original');
figure(2); imshow(gauss); title('Gauss');
figure(3); imshow(laplace); title('Laplace');
figure(4); imshow(Hmax); title('Hmax');
figure(5); imshow(Iclose); title('Close');
figure(6); imshow(Imask); title('Mask');
figure(7); imshow(Inew); title('Filtered');
figure(9); imshow(Iopen); title('Open');
imwrite(Inew, strcat('C:\temp_images\focus_filtered_', num2str(focus), '.bmp'));
if 1 == 0
if (Itotal == 0)
        Itotal = zeros(csize);
end;
Inew(Itotal > 0) = 0; %Do not overwrite if Itotal already has value.
Itotal = uint8(Itotal) + Inew;
end;
if (focus == 0)
    %Add all on last
    %I(Itotal >0) = 0;
    %Itotal = uint8(Itotal) + I;
end;
figure(8); imshow(Itotal); title('Total');
pause;
end;

