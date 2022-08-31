T = 5  ;
s = tf('s');
den = [T T/16 1];
num = 1
ct = tf(num, den)

figure(1)
step(ct);               % Step reponse
stepinfo(ct)            % Menampilkan rise time, settling time, dsb
title("Step response");
figure(2)
step(ct*s);             % Impulse Response
stepinfo(ct*s)          % Menampilkan rise time, settling time, dsb
title("Impulse response");
figure(3)
step(ct / s);           % Ramp response 
stepinfo(ct/s)          % Menampilkan rise time, settling time, dsb
title("Ramp response");

