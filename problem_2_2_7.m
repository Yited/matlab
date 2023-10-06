clear
syms V_in_t V_out_t V_mi I_in w R C t s V_in_s x

V_mi = 0
V_in_t = x
V_in_s = laplace(V_in_t, t,s)

V_out_t = -int(V_in_t,t)/(R*C)
V_out_s = laplace(V_out_t,t,s)
G(s) = V_out_s/V_in_s

pretty(G(s))