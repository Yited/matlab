clear
syms m1 m2 k1 k2 x(t) y(t) X(s) Y(s) X_s Y_s Dx(t) Dy(t) u(t) U(s) G(s)

% m1x''+k1(x)+k2(x-y) = 0
% m2y''+k2(y-x) = -u
m1 = 1;
m2 = 1;
k1 = 1;
k2 = 1;

eqn_a_t = m1*diff(diff(x(t),t),t) + k1*x(t) + k2*(x(t)-y(t)) == 0
eqn_a_lap = laplace(eqn_a_t,t,s)
eqn_a_in = subs(eqn_a_lap,[laplace(x(t),t,s),laplace(y(t),t,s),diff(x(t),t)],[X_s,Y_s,Dx(t)])
eqn_a_s = subs(eqn_a_in,[Dx(0),x(0),y(0)],[0,0,0])

eqn_b_t = m2*diff(diff(y(t),t),t) + k2*(y(t)-x(t)) == -u(t)
eqn_b_lap = laplace(eqn_b_t,t,s)
eqn_b_in = subs(eqn_b_lap,[laplace(x(t),t,s),laplace(y(t),t,s),diff(x(t),t),diff(y(t),t),laplace(u(t),t,s)],[X_s,Y_s,Dx(t),Dy(t),U(s)])
eqn_b_s = subs(eqn_b_in,[Dx(0),Dy(0),x(0),y(0)],[Dy(0),0,0,0])

Y(s) = solve(subs(eqn_b_s,X_s,solve(eqn_a_s,X_s)),Y_s)
G(s) = Y(s)/U(s) %전달함수