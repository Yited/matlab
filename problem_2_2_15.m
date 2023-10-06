f(s) = 1
f(t) = ilaplace(1, t)
m*laplace(diff(diff(x(t),t),t),s) + b*laplace(diff(x(t),t),s) + k*laplace(x(t),s) == f(t)
%초기값이 0이므로 x(0)=x'(0)=0 이다. 따라서 식은 아래와 같다.
m*s^2*laplace(x(t),s) + b*s*laplace(x(t),s) + k*laplace(x(t),s) == laplace(f(t), s)
%위 식을 정리하면 x(s) (= laplace(x(t))) 는 아래와 같이 정리할 수 있다.