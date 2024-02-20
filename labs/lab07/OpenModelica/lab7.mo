model lab7
Real N = 1224;
Real n;
initial equation
n = 14;
equation
der(n) = (0.61 + 0.00061*n)*(N-n);
end lab7;
