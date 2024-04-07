clc
clear
% 1-a
[M, L] = routh_hurwitz(q)
eqn1 = L > 0
eqn2 = L < 0
if(eqn1)
    "stable"
elseif(eqn2)
    "stable"
else
    "unstable"
end

% 1-b
[M, L] = routh_hurwitz(q)
eqn1 = L > 0
[a b] = size(L)
for c = 1:a
    simplify(eqn1(c))
end


% 2
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
s = tf('s');
P_system = K/((J*s+b)*(L*s+R)+K^2);
t_system = 0:0.01:3
Kp = 19.9659;
Ki = 48.2268;
Kd = 1.5;
C = Kp + Ki/s + Kd*s;
sys_cl = feedback(C*P_system,1)
figure(1)
step(sys_cl,t_system)
stepinfo(sys_cl)