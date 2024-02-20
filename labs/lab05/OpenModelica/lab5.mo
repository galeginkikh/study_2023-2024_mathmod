model lab5
Real a = 0.37;
Real b = 0.038;
Real c = 0.36;
Real d = 0.037;
Real x;
Real y;
initial equation
x = 9;
y = 20;
equation
der(x) = -a*x + b*x*y;
der(y) = c*y - d*x*y;
end lab5;
