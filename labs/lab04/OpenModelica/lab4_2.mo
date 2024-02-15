model lab4_2
Real x;
Real y;
Real w = 1.0;
Real g = 7.0;
Real t = time;
initial equation
x = 0.7;
y = 1.5;
equation
der(x) = y;
der(y) = -w*x - g*y;
end lab4_2;
