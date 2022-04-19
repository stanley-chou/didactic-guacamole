function [signal,Fs] = recreater(v,Fs, n, T)
%RECREATER Summary of this function goes here
%   Detailed explanation goes here
Fs = Fs;
signal = [];
interval = floor(length(v)/n);
for i = 0:n-1
    if (i == n-1)
        start=i*interval+1;
        piece = v(start:end);
        slice = voiceslice(piece,T, Fs);
    else
        start = i*interval+1;
        endpoint = start + interval;
        piece = v(start:endpoint);
        slice = voiceslice(piece,T);
    end
    
    
    signal = [signal,slice];
    
    
end
end

