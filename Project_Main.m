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

%Prove that the above pre-emphasis step emphasizes high frequencies.
%In this case, we are interested in 



%Question 3

y1 = abs(fft(xcorr(y,30)));
figure(1)
stem(y1);
title('auto correlation of y(n)');
xlabel("omega")
ylabel("|H(w)|")

%Question 4

y2 = abs(fft(y)).^2;
figure(2)
stem(y2);
title('magnitude squared of y(n)');
xlabel("omega")
ylabel("|H(w)|")

%Question 5  , stuff we are not so sure of


%sound(v,Fs);
[a,g] = lpc(y,30);
ar = filter(a,1,y);
figure(51)
%plot(length(ar),ar);
stem(ar);
figure(52)
%plot(length(y),y);
stem(y);
figure(53)
plot(length(y),y);
stem(v);
[cepstrum,recon] = rceps(y);
figure(54)
semilogy(abs(recon));

%Anis' edits:

%I'll leave my suggestions as comments for now. 
[a,g] = lpc(y,30);
ar = filter(a,1,y);
[d1,p1] = aryule(ar,7);
[H1,w1] = freqz(p1,d1);
plot(w1,H1);
title('magnitude squared of y(n)');
xlabel("omega")
ylabel("|H(w)|")

%Question 6, need to double check this
figure(3);
plot(length(ar),ar);
stem(ar);

%Question 7, 
figure(4);
plot(w1,H1);
title('magnitude squared of y(n)');
xlabel("omega")
ylabel("|H(w)|")


%Question 8, copied from original code, looks good. 
[cepstrum,recon] = rceps(y);
figure(5)
semilogy(abs(recon));


