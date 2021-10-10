% WIENER_FILTER Filter a noisy image with Wiener filter, suppose we know the power
% spectra of the noise and the undegraded image.
%
%   Y = WIENER_FILTER_1(X,H,Sn,Sf) filters a noisy image X with Wiener filter. H defines
%   the degradation function, Sn defines the power spectrum of the noise image and Sf
%   defines the power spectrum of the undegraded image.
%
function Im = wiener_filter(NoisyIm, H, Sn, Sf)

% Check if the noisy image is grayscale and of uint8 datatype.
assert_grayscale_image(NoisyIm);
assert_uint8_image(NoisyIm);


% Filter the noisy image with Wiener filter, suppose we know the power
% spectra of the noise (Sn) and the undegraded image (Sf).


Out=((conj(H).*Sf)./(Sf.*conj(H).*H+Sn)).*fft2(NoisyIm);
Im=real(ifft2(Out));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Convert the image to uint8 datatype.
Im = uint8(Im);

