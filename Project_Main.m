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

%y1 = abs(fft(xcorr(y,30)));
y1 = abs(fft(xcorr(y,y)));
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
[a,g] = lpc(y,30); %getting 30 AR coefficients for the funciton

%[a,g] = lpc(v,30); Paul said to try using V for better results

% Question6

ar = filter(a,1,y); % y(n) = voice*ARfilter
%ar = filter(a,1,v); % y(n) = voice*ARfilter, maybe look at v
ARw = fft(ar, length(v))
frequencies = linspace(0,Fs,length(v));
figure(3)
plot(frequencies, abs(ARw));
hold on
plot(frequencies, abs(fft(y,length(v))));
hold off

 
% [d1,p1] = aryule(ar,30);
% [H1,w1] = freqz(p1,d1);
% figure(7)
% plot(w1,H1);

title('magnitude squared of y(n)');
xlabel("omega")
ylabel("|H(w)|")

% Question 7
%formants are equal to the roots of A 
formants = roots(a);


%Question 8
%method 1
f0 = pitch(y,Fs);
pitchPeriod = Fs/(mean(f0)); %might be more accurate to choose the most common occurring value

% method 2

[cepstrum,recon] = rceps(y);
figure(4)
semilogy(abs(recon));
figure(5)
semilogx(abs(recon));
%method1 get 110,250
%method2 get 111,860



%Question 9


%Question 10

%number how many segments do you want to break the signal into x segments
%of equal amount samples

%for each individual segment take an independent AR coefficient set, take the LPC

%Then create an impulse train from 1 spaced equally btwn pitch period
% impulse = 

%take each LPC segment and their a and convolve with the impulse function
% then put them all together
% and play them.