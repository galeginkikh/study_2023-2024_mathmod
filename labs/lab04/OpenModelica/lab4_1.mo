model lab4_1
Real x;
Real y;
Real w = 13.0;
Real g = 0.0;
Real t = time;
initial equation
x = 0.7;
y = 1.5;
equation
der(x) = y;
der(y) = -w*x - g*y;
end lab4_1;
