function [OuputImg] = StuckizigFunc(InputImg)


%InputImg = InputImg * 255;
[height, width]=size(InputImg);

length = max(height,width);
N = length^2;
b=zeros(N,2);

zz_mtx = zigzag(length);

OuputImg = zeros(height, width);
Ouputtmp = zeros(length, length);
tmp = zeros(length+4, length+4);
tmp(3:height+2, 3:width+2) = InputImg;


for i=1:length
    for j=1:length
        b(zz_mtx(i,j),:)=[i,j];    
    end
end

for n=1:N
    
     i=b(n,1)+2;
     j=b(n,2)+2;
     test=tmp(i,j);
    if test <128
        err = test;
        Ouputtmp(i-2,j-2) = 0;
    else
        err = test - 255;
        Ouputtmp(i-2,j-2) = 255;
    end
    if mod(i+1,2)
        tmp(i, j+1)   = tmp(i, j+1)+8/42*err;
        tmp(i, j+2)   = tmp(i, j+2)+4/42*err;
        tmp(i-1, j+2) = tmp(i-1, j+2)+2/42*err;
        tmp(i+1, j-1) = tmp(i+1, j-1)+4/42*err;
        tmp(i+1, j)   = tmp(i+1, j)+8/42*err;
        tmp(i+1, j+1) = tmp(i+1, j+1)+4/42*err;
        tmp(i+1, j+2) = tmp(i+1, j+2)+2/42*err;
        tmp(i+2, j-2) = tmp(i+2, j-2)+1/42*err;
        tmp(i+2, j-1) = tmp(i+2, j-1)+2/42*err;
        tmp(i+2, j)   = tmp(i+2, j)+4/42*err;
        tmp(i+2, j+1) = tmp(i+2, j+1)+2/42*err;
        tmp(i+2, j+2) = tmp(i+2, j+2)+1/42*err;
    else  
        tmp(i, j+1)   = tmp(i, j+1)+8/42*err;
        tmp(i, j+2)   = tmp(i, j+2)+4/42*err;
        tmp(i-1, j+2) = tmp(i-1, j+2)+2/42*err;
        tmp(i-1, j+1) = tmp(i-1, j+1)+4/42*err;
        tmp(i+1, j)   = tmp(i+1, j)+8/42*err;
        tmp(i+1, j+1) = tmp(i+1, j+1)+4/42*err;
        tmp(i+1, j+2) = tmp(i+1, j+2)+2/42*err;
        tmp(i-2, j+2) = tmp(i-2, j+2)+1/42*err;
        tmp(i+2, j-1) = tmp(i+2, j-1)+2/42*err;
        tmp(i+2, j)   = tmp(i+2, j)+4/42*err;
        tmp(i+2, j+1) = tmp(i+2, j+1)+2/42*err;
        tmp(i+2, j+2) = tmp(i+2, j+2)+1/42*err;
    end

end

    OuputImg = Ouputtmp(1:height,1:width);
    OuputImg = OuputImg/255;



end

