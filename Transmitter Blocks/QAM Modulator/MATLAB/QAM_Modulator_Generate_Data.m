% Author : Jorge Silva, jhgsilva@ua.pt, April 2023

clear variables
close all
clc

M = 256;                                              % Modulation Order
x = (0:M-1)';
y = qammod(x,M,'UnitAveragePower',true);
integerBits = 2;                                    % Q2.14 Format (16bit fixed-point data)
fractionalBits = 14;


maxValue = max(max(real(y)),max(imag(y)));
minValue = min(min(real(y)),min(imag(y)));

% For debugin purposes
% auxFi = fi([],1,16, 14)
% range(auxFi)
% eps(auxFi)

if (M == 8)                                         % 8QAM Cross                                            
y = [-1.00000000000000 - 1.00000000000000i;0.00000000000000 - 2.73205080756888i;2.73205080756888 + 0.00000000000000i;1.00000000000000 - 1.00000000000000i;
    -2.73205080756888 + 0.00000000000000i;-1.00000000000000 + 1.00000000000000i;1.00000000000000 + 1.00000000000000i;0.00000000000000 + 2.73205080756888i];

y = y/sqrt(mean(abs(y).^2));
end

% y = y/max(real(y));

scatterplot(y)

constellationFiReal = fi(real(y),1,integerBits+fractionalBits, fractionalBits);
constellationFiImag = fi(imag(y),1,integerBits+fractionalBits, fractionalBits);

constellationFiRealHex = hex(constellationFiReal);
constellationFiImagHex = hex(constellationFiImag);

% Verify if directory exists. If not create
if ~exist('QAM Modulator Matlab Data', 'dir')
    mkdir('QAM Modulator Matlab Data')
end

strPath = sprintf('QAM Modulator Matlab Data/%sQAM',num2str(M));
if ~exist(strPath, 'dir')
    mkdir(strPath)
end

strFile = sprintf("%s/Real_%sQAM.txt",strPath,num2str(M));
fileID = fopen(strFile,'w+');
for indSymbol = 1 : M
    fprintf(fileID,'%s\n',upper(constellationFiRealHex(indSymbol,:)));
end
fclose(fileID);

strFile = sprintf("%s/Imag_%sQAM.txt",strPath,num2str(M));
fileID = fopen(strFile,'w+');
for indSymbol = 1 : M
    fprintf(fileID,'%s\n',upper(constellationFiImagHex(indSymbol,:)));
end
fclose(fileID);

%% Generate Stimulus Vector to test the VHDL QAM Modulator
binTable = zeros(M,log2(M));
for indSymbol = 1 : M
    auxBin = int2bit(indSymbol-1,log2(M));
    binTable(indSymbol,:) = auxBin.';
end

strFile = sprintf("%s/inputVector%sQAM.txt",strPath,num2str(M));
fileID = fopen(strFile,'w+');
for indSymbol = 1 : M
    strAux = strjoin(string(binTable(indSymbol,:) ),'');
    fprintf(fileID,'%s\n',strAux);
end
fclose(fileID);

%% Generate Expected Output Vector to validate the VHDL QAM Modulator

strFile = sprintf("%s/outputVector%sQAM.txt",strPath,num2str(M));
fileID = fopen(strFile,'w+');
fprintf('Output Vector Expected: [Real] [Imag]\n');
fprintf('Data Format : Q%s.%s\n',num2str(integerBits),num2str(fractionalBits));
for indSymbol = 1 : M
    fprintf(fileID,'%s %s\n',upper(constellationFiRealHex(indSymbol,:)),upper(constellationFiImagHex(indSymbol,:)));
end
fclose(fileID);
