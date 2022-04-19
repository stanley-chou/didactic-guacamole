function [slice] = voiceslice(v, T, Fs)
%generates AR coefficients and excites it with impulse based off of pitch.


ArCoeff = lpc(v, 30);
impulseTrain = zeros(1,length(v));
impulseTrain(1:T:end) = 1;
slice = filter(1,ArCoeff,impulseTrain);
end


