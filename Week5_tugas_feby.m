T = 5;
s = tf('s')
num = [1];
den = [T T/16 1];
sys = tf(num, den);
stepinfo(sys)

Kp = 1;
Kd = [1 3 5 7 9];
sys_c = tf([Kd, Kp], [1, 0]);
final = feedback(sys*sys_c, 1);

%step response display
figure(1)
step(final);                % Step Response
title("Step response");

%impulse response display
figure(2)
impulse(final);             % Impulse Response
title("Impulse response");

%ramp response display
figure(3)
step(final/s);              % Ramp response 
title("Ramp response");

stepinfo(final)     % Menampilkan rise time, settling time, dsb

hold on
step(sys)
step(final)
hold off