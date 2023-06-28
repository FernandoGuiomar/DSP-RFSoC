% Author: Jorge Silva, jhgsilva@ua.pt, May of 2023

% This script is responsable for generating the coefficient files needed
% for the RC parallel filter given a specific number of taps, roll-off 
% factor and DoP.

clear variables
close all
clc

Nsym = 40;              % Filter span in symbol durations
beta = 0.1;             % Roll-off factor
sampsPerSym = 4;        % Upsampling factor

DOP = 32;                % Degree of Parallelism
bitwidth = 16;          % Sample Bitwidth
fractionalPart = 14;    % Sample Fractional Bitwidth

rctFilt = comm.RaisedCosineTransmitFilter(...
  'Shape','Normal', ...
  'RolloffFactor',beta, ...
  'FilterSpanInSymbols',Nsym, ...
  'OutputSamplesPerSymbol',sampsPerSym);

b = coeffs(rctFilt);
coefficients = (b.Numerator)/(max(b.Numerator));    % Normalization (max,norm,...)

dirName = sprintf("DOP_%s",num2str(DOP));
if ~exist(dirName, 'dir')
    mkdir(dirName)
end

for idDOP = 1 : DOP
    initialZeroPaddCoeff = [zeros(1,DOP-idDOP),coefficients];
    finalCoeffPadd = [initialZeroPaddCoeff,zeros(1,ceil(numel(initialZeroPaddCoeff)/DOP)*DOP-numel(initialZeroPaddCoeff))];
    aux = transpose(reshape(finalCoeffPadd,DOP,[]));
    for indFIR = DOP :-1: 1
        coeffAux = aux(:,indFIR);
        coeffFi = fi(coeffAux,1,bitwidth,fractionalPart);
        coeffHex = hex(coeffFi);
        fileNumber = (DOP-indFIR) + DOP*(idDOP-1);
        strFile = sprintf("%s\\filterCoeff%s.txt",dirName,num2str(fileNumber));
        fileID = fopen(strFile,'w+');
        for indCoeff = 1 : numel(coeffAux)
            fprintf(fileID,'%s\n',upper(coeffHex(indCoeff,:)));
        end
        fclose(fileID);
    end
end

figure,freqz(coefficients,1)
figure,stem(coefficients)

%% Save the RRC coefficients to a .txt file (for debugging purposes)
strFile = sprintf("filterCoeff.txt");
fileID = fopen(strFile,'w+');
for indCoeff = 1 : numel(coefficients)
    coeffFi = fi(coefficients(1,indCoeff),1,bitwidth,fractionalPart);
    coeffHex = hex(coeffFi);
    fprintf(fileID,'%s\n',upper(coeffHex));
end
fclose(fileID);