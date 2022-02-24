function [L,x] = Polar_NRZ(S_hift,Bites, Bit_Rate)
Y = 20;
Z = Bites/Bit_Rate; 
N = Y*Bites;
T_Step = Z/N;
L = 0:T_Step:Z;
x = zeros(1,length(L));
s=S_hift*(1/Bit_Rate);
s=fix(s);
for j=0:s
     x(j*Y+1:(j+1)*Y) = 0;
end
for i = s:Bites-1
  if randi([0 1],1) == 1
    x(i*Y+1:(i+1)*Y) = 1;
  else 
    x(i*Y+1:(i+1)*Y) = -1;
  end
end

