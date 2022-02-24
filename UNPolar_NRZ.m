function [L,x] = UNPolar_NRZ(S_hift,bits, bitrate)
Y = 10;
Z = bits/bitrate;
N = Y*bits;
T_Step = Z/N;
L = 0:T_Step:Z;
x = zeros(1,length(L));
s=S_hift*(1/bitrate);
s=fix(s);
for j=0:s
     x(j*Y+1:(j+1)*Y) = 0;
end

for i = s:bits-1
  if randi([0 1],1) == 1
    x(i*Y+1:(i+1)*Y) = 1;
  elseif randi([0 1],1) == 0
    x(i*Y+1:(i+1)*Y) = 0;
  end
end
