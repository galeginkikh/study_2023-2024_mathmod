model lab3
Real x;
Real y;
Real a = 0.35;
Real b = 0.45;
Real c = 0.69;
Real d = 0.61;
Real t = time;
initial equation
x = 105000;
y = 95000;
equation
der(x) = -a*x - b*y + sin(t)*2;
der(y) = -c*x - d*y + cos(t)+1;
end lab3;
