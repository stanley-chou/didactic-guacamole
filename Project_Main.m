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
title('DFt of auto correlation of y(n)');
xlabel("omega")
ylabel("|H(w)|")

%Question 4

y2 = abs(fft(y)).^2;
figure(2)
stem(y2);
title('DFT of the magnitude squared of y(n)');
xlabel("omega")
ylabel("|H(w)|")

%Question 5  , stuff we are not so sure of


%sound(v,Fs);
[a,g] = lpc(y,30); %getting 30 AR coefficients for the funciton

%[a,g] = lpc(v,30); Might try using V for better results

% Question6

ar = filter(1,a,y); % y(n) = voice*ARfilter
%ar = filter(a,1,v); % y(n) = voice*ARfilter, maybe look at v

ARw = fft(ar, length(v));
frequencies = linspace(0,Fs,length(v));
figure(3)
plot(frequencies, abs(ARw),  '--b');
hold on
plot(frequencies, abs(fft(y,length(v))), 'or');
title('Spectrum of y(n) Overlapped with the AR Specturm)');
xlabel("omega")
ylabel("|H(w)|")
legend('AR Spectrum', 'y(n) Spectrum');
hold off

figure(4)

plot(frequencies, abs(ARw),  '--b');
title('AR Spectrum')
figure(5)

plot(frequencies, abs(fft(y,length(v))), 'or');
title('Spectrum of y(n)')
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
figure(7)

semilogy(abs(recon));
title('cepstrum of pre-emphasized voice y(n)')
figure(8)

semilogx(abs(recon));
title('cepstrum semilogx of pre-emphasized voice y(n)')
%method1 get 110,250
%method2 get 111,860
%Noah's voice gets 149,784




%Question 9
%classnumber, file number

% class 1

[v10,Fs10] = audioread('poggers.wav');
[v11,Fs11] = audioread('poggers1class1.wav');
[v12,Fs12] = audioread('poggers2class1.wav');
[v13,Fs13] = audioread('poggers3class1.wav');
[v14,Fs14] = audioread('poggers4class1.wav');
[v15,Fs15] = audioread('poggers5class1.wav');
[v16,Fs16] = audioread('poggers6class1.wav');
[v17,Fs17] = audioread('poggers7class1.wav');
[v18,Fs18] = audioread('poggers8class1.wav');
[v19,Fs19] = audioread('poggers9class1.wav');
[v110,Fs10] = audioread('poggers10class1.wav');

%class2

[v20,Fs20] = audioread('poggers2.wav');
[v21,Fs21] = audioread('poggers1class2.wav');
[v22,Fs22] = audioread('poggers2class2.wav');
[v23,Fs23] = audioread('poggers3class2.wav');
[v24,Fs24] = audioread('poggers4class2.wav');
[v25,Fs25] = audioread('poggers5class2.wav');
[v26,Fs26] = audioread('poggers6class2.wav');
[v27,Fs27] = audioread('poggers7class2.wav');
[v28,Fs28] = audioread('poggers8class2.wav');
[v29,Fs29] = audioread('poggers9class2.wav');
[v210,Fs210] = audioread('poggers10class2.wav');

%applying pre-Emphasis on all signals

y10 = preEmphasis(v10);
y11 = preEmphasis(v11);
y12 = preEmphasis(v12);
y13 = preEmphasis(v13);
y14 = preEmphasis(v14);
y15 = preEmphasis(v15);
y16 = preEmphasis(v16);
y17 = preEmphasis(v17);
y18 = preEmphasis(v18);
y19 = preEmphasis(v19);
y110 = preEmphasis(v110);

y20 = preEmphasis(v20);
y21 = preEmphasis(v21);
y22 = preEmphasis(v22);
y23 = preEmphasis(v23);
y24 = preEmphasis(v24);
y25 = preEmphasis(v25);
y26 = preEmphasis(v26);
y27 = preEmphasis(v27);
y28 = preEmphasis(v28);
y29 = preEmphasis(v29);
y210 = preEmphasis(v210);

%ar-coefficients calculation

PoleCount = 30;

[a10,g10] = lpc(y10,PoleCount);
[a11,g11] = lpc(y11,PoleCount);
[a12,g12] = lpc(y12,PoleCount);
[a13,g13] = lpc(y13,PoleCount);
[a14,g14] = lpc(y14,PoleCount);
[a15,g15] = lpc(y15,PoleCount);
[a16,g16] = lpc(y16,PoleCount);
[a17,g17] = lpc(y17,PoleCount);
[a18,g18] = lpc(y18,PoleCount);
[a19,g19] = lpc(y19,PoleCount);
[a110,g110] = lpc(y110,PoleCount);

[a20,g20] = lpc(y20,PoleCount);
[a21,g21] = lpc(y21,PoleCount);
[a22,g22] = lpc(y22,PoleCount);
[a23,g23] = lpc(y23,PoleCount);
[a24,g24] = lpc(y24,PoleCount);
[a25,g25] = lpc(y25,PoleCount);
[a26,g26] = lpc(y26,PoleCount);
[a27,g27] = lpc(y27,PoleCount);
[a28,g28] = lpc(y28,PoleCount);
[a29,g29] = lpc(y29,PoleCount);
[a210,g210] = lpc(y210,PoleCount);

class1 = zeros(11, PoleCount+1);
class2 = zeros(11, PoleCount+1);

class1(1,:) = a10;
class1(2,:) = a11;
class1(3,:) = a12;
class1(4,:) = a13;
class1(5,:) = a14;
class1(6,:) = a15;
class1(7,:) = a16;
class1(8,:) = a17;
class1(9,:) = a18;
class1(10,:) = a19;
class1(11,:) = a110;

class2(1,:) = a20;
class2(2,:) = a21;
class2(3,:) = a22;
class2(4,:) = a23;
class2(5,:) = a24;
class2(6,:) = a25;
class2(7,:) = a26;
class2(8,:) = a27;
class2(9,:) = a28;
class2(10,:) = a29;
class2(11,:) = a210;

interclass = zeros(22, PoleCount+1);
interclass(1,:) = a10;
interclass(2,:) = a11;
interclass(3,:) = a12;
interclass(4,:) = a13;
interclass(5,:) = a14;
interclass(6,:) = a15;
interclass(7,:) = a16;
interclass(8,:) = a17;
interclass(9,:) = a18;
interclass(10,:) = a19;
interclass(11,:) = a110;
interclass(12,:) = a20;
interclass(13,:) = a21;
interclass(14,:) = a22;
interclass(15,:) = a23;
interclass(16,:) = a24;
interclass(17,:) = a25;
interclass(18,:) = a26;
interclass(19,:) = a27;
interclass(20,:) = a28;
interclass(21,:) = a29;
interclass(22,:) = a210;
%average euclidean distance calculation  calculation

intraClass1 = eucDistance(class1)
intraClass2 = eucDistance(class2)

interClassDistance = eucDistance(interclass)


%Question 10

recreated = recreater(v,Fs, 100, 110250);

soundsc(recreated,Fs);

%number how many segments do you want to break the signal into x segments
%of equal amount samples

%for each individual segment take an independent AR coefficient set, take the LPC

%Then create an impulse train from 1 spaced equally btwn pitch period
% impulse = 

%take each LPC segment and their a and convolve with the impulse function
% then put them all together
% and play them.