function BRIm = band_reject_filter(NoiseIm, D0, W)

F=fft2(NoiseIm);
D=abs(F);
Fc=fftshift(F);
S2 = log(1+abs(Fc));

Gussian=1-exp(-0.5.*((D.^2-D0.^2)./(D.*W)).^2);
G=Gussian.*F;
g=ifft2(G);
BRIm=uint8(g);

end