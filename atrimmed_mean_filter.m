function atrim=atrimmed_mean_filter(NoisyIm,d)

%the mask size is set to be 3x3
masksize=1;

NoisyIm = double(NoisyIm);
[sizeX, sizeY] = size(NoisyIm);

 % create a zero matrix with the same size of the input image
reformedimage(sizeX,sizeY)=zeros;

for i=1:sizeX;
    for j=1:sizeY;
        window=[];
        for m=-masksize:masksize;
            for n=-masksize:masksize;

% apply the alpha trimmed mean filter

                if i+m>=1 & i+m<=sizeX & j+n>=1 & j+n<=sizeY
                    window=[window,NoisyIm(i+m,j+n)];
                    %i
                    %j
                    %window
                end
                window=sort(window); 
                %window
                window_adj=window(1+d/2:length(window)-d/2);
                %window_adj
                reformedimage(i,j)=round(mean(window_adj));
            end
        end

% apply the alpha trimmed mean filter

                window=sort(window); 
                %window
                window_adj=window(1+d/2:length(window)-d/2);
                %window_adj
                reformedimage(i,j)=round(mean(window_adj));    
    end
end

atrim=uint8(reformedimage);