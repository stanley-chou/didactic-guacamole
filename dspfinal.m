[v,Fs] = audioread('poggers.wav');
v = v(:,1);
y = v;
c = 0.98;
for n= 2:length(v)
    y(n) = v(n) - c*v(n-1);
end
y1 = abs(fft(xcorr(y,30)));
figure()
 stem(y1);
 title('auto correlation of y(n)');
y2 = abs(fft(y)).^2;
figure()
stem(y2);
 title('magnitude squared of y(n)');
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