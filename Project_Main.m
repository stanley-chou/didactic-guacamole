%DSP Final Project

%Question 1

disp('initial commit')
disp('testing')


[v,Fs] = audioread('poggers2.wav');

% Question 2

v = v(:,1);
y = v;
c = 0.98;

for n= 2:length(v)
    y(n) = v(n) - c*v(n-1);
end

%Question 3

y1 = abs(fft(xcorr(y,30)));
figure(1)
stem(y1);
title('auto correlation of y(n)');

%Question 4

y2 = abs(fft(y)).^2;
figure(2)
stem(y2);
title('magnitude squared of y(n)');

%Question 5  , stuff we are not so sure of


%sound(v,Fs);
[a,g] = lpc(y,30);
ar = filter(a,1,y);
figure()
%plot(length(ar),ar);
stem(ar);
figure()
%plot(length(y),y);
stem(y);
figure()
%plot(length(y),y);
stem(v);
[cepstrum,recon] = rceps(y);
figure()
semilogy(abs(recon));