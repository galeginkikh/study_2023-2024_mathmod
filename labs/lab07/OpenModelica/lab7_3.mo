model lab7_3
Real N = 1224;
Real n;
initial equation
n = 14;
equation
der(n) = (0.7 * time + 0.6*cos(time)*n)*(N-n);
end lab7_3;
