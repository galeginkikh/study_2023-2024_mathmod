model lab3_2
Real x;
Real y;
Real a = 0.35;
Real b = 0.73;
Real c = 0.45;
Real d = 0.41;
Real t = time;
initial equation
x = 105000;
y = 95000;
equation
der(x) = -a*x - b*y + sin(2*t) * 2;
der(y) = -c*x*y - d*y + cos(t) + 1;
end lab3_2;
