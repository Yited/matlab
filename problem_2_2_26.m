clear
syms x(t) Dx(t) X_s X(s) y(t) Dy(t) Y(s) Y_s M m b k f(t) F(s)

% Mx''+b(x'-y')+k(x-y) = f(t)
% my''+b(y'-x')+k(y-x) = 0

eqn_a_t = M*diff(diff(x(t),t),t) + b*(diff(x(t),t)-diff(y(t),t))+k*(x(t)-y(t)) == f(t)
eqn_a_lap = laplace(eqn_a_t,t,s)
eqn_a_in = subs(eqn_a_lap,[laplace(x(t),t,s),laplace(y(t),t,s),diff(x(t),t),laplace(f(t),t,s)],[X_s,Y_s,Dx(t),F(s)])
eqn_a_s = subs(eqn_a_in,[Dx(0),x(0),y(0)],[0,0,0])

eqn_b_t = m*diff(diff(y(t),t),t) + b*(diff(y(t),t)-diff(x(t),t))+k*(y(t)-x(t)) == 0
eqn_b_lap = laplace(eqn_b_t,t,s)
eqn_b_in = subs(eqn_b_lap,[laplace(x(t),t,s),laplace(y(t),t,s),diff(x(t),t),diff(y(t),t),laplace(f(t),t,s)],[X_s,Y_s,Dx(t),Dy(t),F(s)])
eqn_b_s = subs(eqn_b_in,[Dx(0),Dy(0),x(0),y(0)],[Dy(0),0,0,0])

Y(s) = solve(subs(eqn_b_s,X_s,solve(eqn_a_s,X_s)),Y_s)
Y(s)/F(s) %F(s)가 약분이 안 돼요 ㅠㅠ