close all
clear all
pkg load image

im = rgb2gray(imread('C:\Users\bianca.silva.143\Downloads\folha.png'));

figure('Name','Imagem Original');
imshow(im)

h = imhist(im);
v(1,:) = h(:,1);
figure('Name','Histograma Original');
plot(v)

v1 = v;

for(j=2:size(v,2))
  if(v1(1,j)<v1(1,j-1))
    v1(1,j) = v1(1,j-1);
  endif
endfor

figure('Name','Histograma Normalizado v1: esq -> dir');
plot(v1)


v2 = v;

for(j=size(v,2)-1:-1:1)
  if(v2(1,j)<v2(1,j+1))
    v2(1,j) = v2(1,j+1);
  endif
endfor

figure('Name','Histograma Normalizado v2: dir -> esq');
plot(v2)

pico1 = max(v);
for(j=1:size(v,2))
  if(v(1,j)==pico1)
    intensidadePico1 = j; %j-1
  endif
endfor

pico1 %o valor do pico no gráfico - eixo y
intensidadePico1 %o valor no gráfico do eixo x

for(j=1:size(v,2))
  if((v1(1,j)==0)|(v1(1,j)==pico1))
    v1(1,j) = -1;
  endif
endfor
for(j=1:size(v,2))
  if((v2(1,j)==0)|(v2(1,j)==pico1))
    v2(1,j) = -1;
  endif
endfor

figure('Name','Histograma Normalizado v1: esq -> dir, com flag');
plot(v1)
figure('Name','Histograma Normalizado v1: dir -> esq, com flag');
plot(v2)

rep1 = rep2 = zeros(2,256);
for(j=1:size(v1,2))
  if(v1(1,j)!=-1)
    rep1(1,j) = v1(1,j);
    rep1(2,j) = 1;
    for(k=j+1:size(v1,2))
      if((v1(1,k)==rep1(1,j))&(v1(1,k)!=-1))
        rep1(2,j)++;
        v1(1,k)=-1;
      endif
    endfor
  endif
endfor

maior = rep1(2,1);
for(i=1:size(rep1,2))
  if(rep1(2,i)>maior)
    maior = rep1(2,i);
    pico2 = rep1(1,i);
  endif
endfor

pico2

intensidadePico2 = 0;
for(j=1:size(v1,2))
  if(v1(1,j)==pico2)
    intensidadePico2 = j;
    break;
  endif
endfor

intensidadePico2

% --- Continuação para encontrar o Limiar  - 25/08/2026 ---

picoEsq = min(intensidadePico1, intensidadePico2);
picoDir = max(intensidadePico1, intensidadePico2);

menorValor = Inf;
limiar = picoEsq;

for j = picoEsq : picoDir
  if (v(1, j) < menorValor)
    menorValor = v(1, j);
    limiar = j;
  endif
endfor

fprintf('Valor do limiar: %d\n', limiar);
imagemBinaria = im > limiar;
figure('Name', 'Imagem Segmentada (Binarizada)');
imshow(imagemBinaria);

