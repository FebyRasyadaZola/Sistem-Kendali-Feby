T = 5;
s = tf('s')
num = [1];
den = [T T/16 1];
sys = tf(num, den);
stepinfo(sys)

Kp = 1;
Ki = [1 3 5 7 9];
sys_c = tf([Kp, Ki], [1, 0]);
final = feedback(sys*sys_c, 1);

%step response display
figure(1)
step(final/s);
stepinfo(final/s);
title("Step response");

%impulse response display
figure(2)
impulse(final);             % Impulse Response
stepinfo(final);
title("Impulse response");

%ramp response display
figure(3)
step(final/s*s);           % Ramp response 
stepinfo(final/s*s)          % Menampilkan rise time, settling time, dsb
title("Ramp response");

hold on
step(sys)
step(final)
hold off