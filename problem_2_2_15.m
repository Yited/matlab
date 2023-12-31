clear
syms b k m s t x(t) x_s f(t) f(s) eqn_t eqn_s diffx(t)

f(s) = 1
f(t) = ilaplace(1, t)
eqn_t = m*laplace(diff(diff(x(t),t),t),t,s) + b*laplace(diff(x(t),t),t,s) + k*laplace(x(t),t,s) == 1
eqn_s = subs(subs(eqn_t,[laplace(x(t),t,s),x(0),diff(x(t),t)],[x_s,0,diffx(t)]),diffx(0),0)
x(s) = solve(eqn_s,x_s)
x(t) = ilaplace(x(s),s,t)