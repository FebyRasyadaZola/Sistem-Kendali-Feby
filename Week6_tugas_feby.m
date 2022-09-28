%%%ZN1

%% declaration of system variable
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
s = tf('s');

%% declaration system
num = K;
den = [J*L,((b*L)+(J*R)),((b*R)+(K*K))];
sys = tf(num,den)/s

%%declaration tunning variable
use_p = 1;
use_i = 1;
use_d = 1;

delay_t = 1;
constant_t = 10;

kp = 0;
Ti = inf;
Td = 0;

%% ZN1 
if(use_p)
    if(use_i)
        if(use_d)
            kp = constant_t/delay_t*1.2;
            Ti = delay_t*2;
            Td = 0.5*delay_t;
        else
            kp = constant_t/delay_t*0.9;
            Ti = delay_t/0.3;
            Td = 0
        end
    else 
        kp = delay_t/constant_t*1.2;
        Ti = inf;
        Td = 0
    end
end

kp = kp
ki = kp/Ti
kd = kp*Td

%% system control function
sys_c = tf([kd,kp,ki],[1 0])

complate = feedback(sys*sys_c,1)

%%display graph

figure(1)
step(complate); 
legend('step kd(1)')
stepinfo(complate)