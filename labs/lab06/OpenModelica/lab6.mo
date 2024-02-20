model lab6
Real N = 10400;
Real I;
Real R;
Real S;
Real alpha = 0.6; 
Real beta = 0.2;
initial equation
I = 144;
R = 28;
S = N - I - R;
equation
der(S) = 0;
der(I) = -beta*I;
der(R) = beta*I;

end lab6;
