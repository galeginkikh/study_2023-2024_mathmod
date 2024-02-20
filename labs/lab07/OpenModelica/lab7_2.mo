model lab7_2
Real N = 1224;
Real n;
initial equation
n = 14;
equation
der(n) = (0.000073 + 0.73*n)*(N-n);
end lab7_2;
