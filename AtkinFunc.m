function [OuputImg] = AtkinFunc(InputImg)

%function atkinsonFunc
%InputImg = InputImg * 255;
[height, width]=size(InputImg);

OuputImg = zeros(height, width);
tmp = zeros(height+4, width+4);
tmp(3:height+2, 3:width+2) = InputImg;

for i = 3:height+2
    for j = 3:width+2
        if tmp(i, j) < 128
            OuputImg(i-2, j-2) = 0;
            err = tmp(i, j);
        else
            OuputImg(i-2, j-2) = 255;
            err = tmp(i, j) - 255;
        end
        if mod(i-2,2)
            tmp(i, j+1)   = tmp(i, j+1)+1/9*err;
            tmp(i, j+2)   = tmp(i, j+2)+1/9*err;
            tmp(i+1, j-1) = tmp(i+1, j-1)+1/9*err;
            tmp(i+1, j)   = tmp(i+1, j)+1/9*err;
            tmp(i+1, j+1) = tmp(i+1, j+1)+1/9*err;
            tmp(i+2, j)   = tmp(i+2, j)+1/9*err;
        else
            tmp(i, j+1)   = tmp(i, j+1)+1/9*err;
            tmp(i, j+2)   = tmp(i, j+2)+1/9*err;
            tmp(i-1, j+1) = tmp(i-1, j+1)+1/9*err;
            tmp(i+1, j)   = tmp(i+1, j)+1/9*err;
            tmp(i+1, j+1) = tmp(i+1, j+1)+1/9*err;
            tmp(i+2, j)   = tmp(i+2, j)+1/9*err;
       end
        
    end
end
 
OuputImg = OuputImg/255;

end

