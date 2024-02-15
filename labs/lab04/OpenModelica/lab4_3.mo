model lab4_3
Real x;
Real y;
Real w = 30.0;
Real g = 1.0;
Real t = time;
initial equation
x = 0.7;
y = 1.5;
equation
der(x) = y;
der(y) = -w*x - g*y + sin(0.6*t);
end lab4_3;
