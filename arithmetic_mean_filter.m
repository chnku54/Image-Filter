% ARITHMETIC_MEAN_FILTER Filter a noisy image with an arithmetic mean filter.
%
%   Y = ARITHMETIC_MEAN_FILTER(X) filters a noisy image X with an arithmetic mean filter.
%   A 3-by-3 window is used in the filtering process.
%
function Im = arithmetic_mean_filter(NoisyIm)

% Check if the noisy image is grayscale and of uint8 datatype.
assert_grayscale_image(NoisyIm);
assert_uint8_image(NoisyIm);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filter the noisy image with arithmetic mean filter.  Use a 3x3 window to
% filter the image.

[m,n]=size(NoisyIm)

add_h=zeros(1,n);
NoisyIm_adj=[add_h; add_h; NoisyIm ;add_h ;add_h];

add_v=zeros(m+4,1);
NoisyIm_adj2=[add_v, add_v, NoisyIm_adj, add_v ,add_v];

Im=zeros(m,n);

for i=(1:m)+2
    for j=(1:n)+2
        Im(i-2,j-2)=round(mean(NoisyIm_adj2(i-2:i+2,j-2:j+2),'all'));
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rescale the grayscale values of the filtered image to 0-255 and convert
% the image to uint8 datatype.
Im = (Im-min(Im(:)))./(max(Im(:))-min(Im(:))).*255;
Im = uint8(Im);