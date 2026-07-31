clear all
close all

% imagem do circulo - - - objetivo A

m1 = imread('/MATLAB Drive/PDI2026/imagens/circulo.JPG');

figure ('Name','Imagem Original')
imshow(m1);

m2 = m1;

[x,y]= size(m2);

for(i=1:x)
    for(j=1:y)
        
        if(m2(i,j) >190)
        m2(i,j) = 127;
        end
    end
end

figure('Name','Imagem Cinza')
imshow(m2);
imwrite(m2,'circulo2.jpg');

% imagem lena - - - objetivo B

im = imread('/MATLAB Drive/PDI2026/imagens/lena.JPG');

size(im)

[a,b] = size(im);

for(i=1:a)
    for(j = 1:b)
       im(i,j) = im(i,j) +80;
    end
end

figure('Name','Imagem Saturada')
imshow(im);

for(i=1:a)
    for(j = 1:b)
       im(i,j) = im(i,j)-80;
    end
end

figure('Name','Imagem revertida')
imshow(im);

n = input('Digite o valor de acrescimo: ');

for(i=1:a)
    for(j = 1:b)
       im(i,j) = im(i,j)+n;
    end
end

figure('Name','Imagem com acrescimo N')
imshow(im);