clear all; 
close all; 

% objetivo A

im = uint8(zeros(255,255)); 

for(i = 1:255)
    for(j = 1:255)
        
        im(i,j) = i;
    end
end

figure('Name','Degrade')
imshow(im);

for i = 1:255
    for j = 1:255
        if (i >= 8 && i < 25) || (i >= 230 && i < 247)
            im(i,j) = 127;
        end
        if (j >= 8 && j < 25) || (j >= 230 && j < 247)
            im(i,j) = 127;
        end
        
    end
end

figure('Name', 'moldura');
imshow(im);

% objetivo B

tic
imgOriginal = rgb2gray(imread('/MATLAB Drive/PDI2026/imagens/lena.JPG'));

img = imgOriginal;
imOrig = imgOriginal;
[a,b] = size(img); 

for(i = 1:a)
    for(j = 1:b)
        img(i,j) = img(i,j) +img(i,j)*0.8;
    end
end

imClara = img;
figure('Name', 'imClara');
imshow(imClara);

for(i = 1:a)
    for(j = 1:b)
        img(i,j) = img(i,j) -img(i,j)*0.8;
    end
end
imEscura = img;
figure('Name', 'imEscura');
imshow(imEscura);

% * atribuição direta
% imclara

imgOriginal(:,:) = imgOriginal(:,:) +imgOriginal(:,:)*0.8;
figure('Name', 'atribuicao direta 1');
imshow(imgOriginal);

%imEscura
imgOriginal(:,:) = imgOriginal(:,:) -imgOriginal(:,:)*0.8;
figure('Name', 'atribuicao direta 2');
imshow(imgOriginal);

toc


% objetivo C

[a, b] = size(imOrig);

imDouble = double(imOrig);
imDegrade = zeros(a, b);

for i = 1:a
    for j = 1:b
        
        fator = (j - 1) * 1.5 / (b - 1);
   imDegrade(i,j) = imDouble(i,j) * fator;
    end
end
imDegrade(imDegrade > 255) = 255;

imDegrade = uint8(imDegrade);

figure('Name', 'Lena Degrade');
imshow(imDegrade);

imPosterizada = imOrig; 

[a, b] = size(imPosterizada);

for i = 1:a
    for j = 1:b
        
        if imPosterizada(i,j) < 85
            imPosterizada(i,j) = 0;
            
        elseif imPosterizada(i,j) < 171
            imPosterizada(i,j) = 127;
        else
            imPosterizada(i,j) = 255; 
        end
        
    end
end

figure('Name', 'Posterizacao em 3 Niveis');
imshow(imPosterizada);

