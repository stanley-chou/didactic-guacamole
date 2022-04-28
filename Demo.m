%Noah Voice
[v,Fs] = audioread('poggers.wav');

y  = preEmphasis(v);
figure(10);
plot(y);
title("Noam Poggers")
xlabel("sample number")
ylabel("amplitude")
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