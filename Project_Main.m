
%DSP Final Project Code Group 15

%Question 1

%reading the audio file
[v,Fs] = audioread('poggers2.wav');

% Question 2
%applying pre-emphasis to the audio file
v = v(:,1);
y = v;
c = 0.98;

for n= 2:length(v)
    y(n) = v(n) - c*v(n-1);
end


%Question 3

%Get the DFt of the Autocorrelation of y(n)
%y1 = abs(fft(xcorr(y,30)));
y1 = abs(fft(xcorr(y,y)));
figure(1)
stem(y1);
title('DFT of auto correlation of y(n)');
xlabel("\omega")
ylabel("|H(w)|")

%Question 4

%Get DFT of the magnitude squared of y(n)
y2 = abs(fft(y)).^2;
figure(2)
stem(y2);
title('DFT of the magnitude squared of y(n)');
xlabel("\omega")
ylabel("|H(w)|")

%Question 5  


[a,g] = lpc(y,30); %getting 30 AR coefficients for the the pre-emphasized voice signal

% Question6

figure(70)
y= y(63024:73187);
plot(y);
title("Voiced Segment Example")
xlabel("sample number")
ylabel("amplitude")
ar = filter(1,a,y); % y(n) = voice*ARfilter
%ar = filter(a,1,v); % y(n) = voice*ARfilter, maybe look at v

ARw = fft(ar, length(v));
frequencies = linspace(0,Fs,length(v));
figure(3)
plot(frequencies, abs(ARw),  '--b');
hold on
plot(frequencies, abs(fft(y,length(v))), 'r');
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

figure(69)
plot(frequencies, abs(ARw),  'b');
hold on
plot(frequencies, 7.*abs(fft(y,length(v))), 'r');
title('Spectrum of y(n) multiplied by 7 Overlapped with the AR Specturm)');
xlabel("omega")
ylabel("|H(w)|")
legend('AR Spectrum', 'y(n) Spectrum');
hold off

% Question 7
%formants are equal to the roots of A 
formants = roots(a);


%Question 8
%method 1
 %pitch period and frequency via the pitch function
f00 = pitch(v,Fs);
pitchPeriod = Fs/(mean(f00)); %might be more accurate to choose the most common occurring value, or the median

 %primarily the group picked the value by directly looking at the pitch
 %plot as it was the most accurate

% method 2
%pitch period and frequency via the rceps function

[cepstrum,recon] = rceps(y);
figure(7)

semilogy(abs(recon));
title('cepstrum of pre-emphasized voice y(n)Female')
figure(8)

semilogx(abs(recon));
title('cepstrum semilogx of pre-emphasized voice y(n)')
%method1 get 110,250
%method2 get 111,860
%Noah's voice gets 149,784

%experiments on female voice

[v,Fs] = audioread('Female_Voice.wav');

y  = preEmphasis(v);

figure(50)
plot(y)
y = y(36417:67824);
fem = pitch(v,Fs);
[cepstrum,recon] = rceps(y);
figure(12)
semilogy(abs(recon));
%soundsc(y,Fs);
%pause(2);
title('cepstrum of pre-emphasized female voice y(n)')

%Question 9
%classnumber, file number
%intraclass and interclass distance measures
% class 1

NumSigPerClass = 10;

PoleCount = 30;
class1 = zeros(11, PoleCount+1);
class2 = zeros(11, PoleCount+1);
interclass = zeros(22, PoleCount+1);
for i=1:NumSigPerClass
[v1{i},Fs1{i}] = audioread(strcat('poggers',num2str(i),'class1.wav'));
[v2{i},Fs2{i}] = audioread(strcat('poggers',num2str(i),'class2.wav'));
v1{i} = preEmphasis(v1{i});
    v2{i} = preEmphasis(v2{i});
    [v1{i},~] = lpc(v1{i},PoleCount);
    [v2{i},~] = lpc(v2{i},PoleCount);
    class1(i,:) = v1{i};
    class2(i,:) = v2{i};
    interclass(i,:) = v1{i};
    interclass(NumSigPerClass+i,:) = v2{i};
end
i=NumSigPerClass+1;
hi = strcat('poggers.wav');
[v1{i},Fs1{i}] = audioread(hi);
[v2{i},Fs2{i}] = audioread(strcat('poggers2.wav'));
v1{i} = preEmphasis(v1{i});
    v2{i} = preEmphasis(v2{i});
    [v1{i},~] = lpc(v1{i},PoleCount);
    [v2{i},~] = lpc(v2{i},PoleCount);
    class1(i,:) = v1{i};
    class2(i,:) = v2{i};
    interclass(NumSigPerClass*2+1,:) = v1{i};
    interclass(NumSigPerClass*2+2,:) = v2{i};

%average euclidean distance calculation  calculation

intraClass1 = eucDistance(class1)
intraClass2 = eucDistance(class2)

interClassDistance = eucDistance(interclass)

cosintraClass1 = cosDistance(class1)
cosintraClass2 = cosDistance(class2)

cosinterClassDistance = cosDistance(interclass)

%Question 10

% Voice recreation

%Noah Voice
[v,Fs] = audioread('poggers.wav');

y  = preEmphasis(v);
figure(10);
plot(y);
y = y(4701:57553);

numberof = (length(y)/380);
splits = floor(numberof);
recreated = recreater(y,Fs, splits, 380);
soundsc(y,Fs);
pause(2);
soundsc(recreated,Fs);
pause(2);
recreatedFilt = lowpass(recreated,8000,Fs);
soundsc(recreatedFilt,Fs);
pause(2);

%Stanley voice
% 373 was the pitch
[v,Fs] = audioread('poggersexp.wav');
y  = preEmphasis(v);
f02 = pitch(y,Fs);
pitchPeriod2 = floor(Fs/(mode(f02)));
y = y(4241:30425);
figure(11);
plot(y);
title("Stanley Poggers")
xlabel("sample number")
ylabel("amplitude")
numberof = (length(y)/373);
splits = ceil(numberof);
recreated = recreater(y,Fs, splits, 373);
soundsc(y,Fs);
pause(2);
soundsc(recreated,Fs);
pause(2);
recreatedFilt = lowpass(recreated,8000,Fs);
soundsc(recreatedFilt,Fs);


% not really worked on, but quick female voice recreation. 
% [v,Fs] = audioread('Female_Voice.wav');
% y  = preEmphasis(v);
% y = y(36417:67824);
% numberof = (length(y)/173);
% splits = ceil(numberof);
% recreated = recreater(y,Fs, splits, 173);
% soundsc(y,Fs);
% pause(2);
% soundsc(recreated,Fs);
% pause(2);
% recreatedFilt = lowpass(recreated,8000,Fs);
% soundsc(recreatedFilt,Fs);
%number how many segments do you want to break the signal into x segments
%of equal amount samples

