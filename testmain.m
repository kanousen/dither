% files = dir(fullfile('C:\\Users\\qsting\\Desktop\\test\\target_img\\','*.bmp'));
% lengthFiles = length(files);

% for i = 1:lengthFiles
%     Img = im2double(imread(strcat('C:\Users\qsting\Desktop\test\target_img\',files(i).name)));
clc
clear all
close all


f=zeros(12,256);
consterr=[56,28,6,12,40,4,2,3,6,20,2,1]/180;

for fnum=1:12
    for ferr=0:127
        f(fnum,ferr+1)= consterr(fnum)*ferr;
    end
    for ferr=128:255
        f(fnum,ferr+1)= consterr(fnum)*(ferr-255);
    end
end




% 
img = (imread('C:\Users\VS_SR\Desktop\test\target_img\002661.png'));
%img = (imread('C:\Users\VS_SR\Desktop\test\target_img\4K.png'));
% img = (imread('C:\Users\VS_SR\Desktop\test\target_img\0007.png'));
% img = (imread('C:\Users\VS_SR\Desktop\test\target_img\004650.png'));
% img = (imread('C:\Users\VS_SR\Desktop\test\target_img\002.bmp'));
% img = (imread('C:\Users\VS_SR\Desktop\test\target_img\006503.png'));
%img = (imread('C:\Users\qsting\Desktop\test\target_img\005342.png'));
%img = (imread('C:\Users\qsting\Desktop\test\target_img\Cameraman256.bmp'));

%img = imadjust(img,[0.1 0.9],[]);

%img = rot90(img,1);

[a,b,c]=size(img);
if c ~= 1
        Img = rgb2gray((img));
else Img=img;
end


%  figure;
%  imshow(img);
% 
% imgdither = dither(Img);
% figure;
% imshow(imgdither);

[height, width]=size(Img);

tic
% outzig = zeros(height, width);
% outzig = testzigFunc(Img);
% figure;
% imshow(outzig);


% outsnack = zeros(height, width);
% outsnack = FloydsnackFunc(Img);
% figure;
% imshow(outsnack);
% 
% outzig = zeros(height, width);
% outzig = FloydzigFunc(Img);
% figure;
% imshow(outzig);


% out = zigFunc(Img);
% figure;
% imshow(out);
% 
% out = AtkinzigFunc(Img);
%  figure;
%  imshow(out);
% out = BurkeszigFunc(Img);
%  figure;
%  imshow(out);

% outzig = zeros(height, width);
% outzig = Sierra3Func(Img);
% figure;
% imshow(outzig);


% 
% outzig = zeros(height, width);
% outzig = new1zigFunc(Img);
% figure;
% imshow(outzig);

outzig = zeros(height, width);
outzig = Stucki4Func(Img);
figure;
imshow(outzig);

% outzig = zeros(height, width);
% outzig = BurkeszigFunc(Img);
% figure;
% imshow(outzig);



% outzig = zeros(height, width);
% outzig = Floyd3Func(Img);
% figure;
% imshow(outzig);

% outzig = zeros(height, width);
% outzig = Floyd4Func(Img);
% figure;
% imshow(outzig);

% outzig = zeros(height, width);
% outzig = Stucki2Func(Img);
% figure;
% imshow(outzig);
% 
% outzig = zeros(height, width);
% outzig = Stucki4Func(Img);
% figure;
% imshow(outzig);
% 

% tic
% outzig = zeros(height, width);
% outzig = newFloyd4Func(Img);
% figure;
% imshow(outzig);
% 
% 
% toc
% 
% tic
% 
% outzig1 = zeros(height, width);
% outzig1 = Floyd4Func(Img);
% figure;
% imshow(outzig1);
% 
% toc
% 
% tic
% outzig = zeros(height, width);
% outzig = newStucki4Func(Img);
% figure;
% imshow(outzig);
% 
% 
% toc
% 
% tic
% 
% outzig1 = zeros(height, width);
% outzig1 = Stucki4Func(Img);
% figure;
% imshow(outzig1);
% 
% toc



% outzig = zeros(height, width,'uint8');
% outzig = Floyd2Func(Img);
% figure;
% imshow(outzig);

% outzig = zeros(height, width,'uint8');
% outzig = Stucki3Func(Img);
% figure;
% imshow(outzig);

% outzig1 = zeros(height, width);
% for a=1:100
%     
%     %outzig1 = mFloyd2Func(Img, f);
%     
% 
%      outzig1 = Floyd2Func(Img);
% end

toc
