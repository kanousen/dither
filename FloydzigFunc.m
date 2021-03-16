function [OuputImg] = FloydzigFunc(InputImg)

[height, width]=size(InputImg);
length = max(height,width);
N = length^2;
b=zeros(N,2);

zz_mtx = zigzag(length);

OuputImg = zeros(height, width);
Ouputtmp = zeros(length, length);
tmp = zeros(length+2, length+2);
tmp(2:height+1, 2:width+1) = InputImg;


for i=1:length
    for j=1:length
        b(zz_mtx(i,j),:)=[i,j];    
    end
end

for n=1:N
    
     i=b(n,1)+1;
     j=b(n,2)+1;
     test=tmp(i,j);
    if test <128
        err = test;
        Ouputtmp(i-1,j-1) = 0;
    else
        err = test - 255;
        Ouputtmp(i-1,j-1) = 255;
    end
    if mod(i-1,2)
        tmp(i, j+1) = tmp(i, j+1)+7/16*err;
        tmp(i-1, j+1) = tmp(i-1, j+1)+3/16*err;
        tmp(i+1, j) = tmp(i+1, j)+5/16*err;
        tmp(i+1, j+1) = tmp(i+1, j+1)+1/16*err;        
    else
        tmp(i, j+1) = tmp(i, j+1)+5/16*err;
        tmp(i+1, j-1) = tmp(i+1, j-1)+3/16*err;
        tmp(i+1, j) = tmp(i+1, j)+7/16*err;
        tmp(i+1, j+1) = tmp(i+1, j+1)+1/16*err;
    end
end

    OuputImg = Ouputtmp(1:height,1:width);
    OuputImg = OuputImg/255;


end

