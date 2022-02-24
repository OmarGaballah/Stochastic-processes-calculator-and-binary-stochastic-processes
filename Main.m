
theta = unifrnd(-pi,pi,1000);
omega_c = 2*pi;
A = 5;
t2 =linspace(-5,5,1000);
Step_Size = t2(1,2)-t2(1,1);
for i=1:1000
    x(i,:)=A * cos(omega_c .* t2 +theta(1,i));
end
%% Plot M
 disp("5 sample functions");
   for i=1:5  %M
     subplot(3,3,i);
     plot(t2,x(i,:));
     title (sprintf('%dth sample function',i))
     xlabel('Time');
     ylabel('Amplitude');
   end
%% Enssemble mean,plot
disp("Enssemble");
m_mean = mean(x);
plot(t2,m_mean)
title('The Ensemble Mean')
xlabel('Time');
ylabel('Amplitude');
%% Calculates the time mean 
disp("TIME_ACC");
Summation=sum(x(5,:)); %n 
Time_mean=abs(Summation*Step_Size*(1/10)) % largest of t - smallest of t
%% Calculate and plot the statistical auto-correlation (CHECK TOMORROW FROM TARIK YA 3LEQ)
disp("statistical_ACC");
S_AC=0;
for v=1:1000
    S_AC=S_AC+ (x(v,4)*x(v,20)); %I,J
end
S_AC=S_AC/height(x)
%% Calculate the time auto-correlation function
tawo=1;
disp("TIME_ACC");
Time_ACC= zeros(1,width(x));
for tawo=1:width(x)-1
    for i=1:width(x) %From 1 to the size of the columns
        if i+tawo <= width(x)
       Time_ACC(tawo)=Time_ACC(tawo)+(x(6,i)*x(6,i+tawo)*Step_Size *(1/10)); %n
        end
    end
end
 plot(t2,Time_ACC)
 title('Time Auto-Correlation Function');
 xlabel('Time');
 ylabel('Amplitude');
%% Calculate and plot the power spectral density
FT_S_AC=zeros(height(x),width(x));
for I=1:width(x)
    for J=1:width(x)
        for v=1:height(x)       
    FT_S_AC(I,J)=FT_S_AC(I,J)+(x(v,I)*x(v,J)); %I,J
        end
        FT_S_AC(I,J)=FT_S_AC(I,J)/height(x);
    end
end
FFT_S_AC= fftshift(fft(FT_S_AC))./length(t2);
FFT_S_AC=abs(FFT_S_AC);
z=linspace(-50,50,width(x));
surf(FT_S_AC)
title("The Statistical Auto-Correlation");
xlabel('Time');
ylabel('Amplitude');
set(FT_S_AC,'LineStyle','none')
plot(z,FFT_S_AC)
title('Power Spectral Density');
xlabel('Frequency in HZ');
ylabel('Amplitude');
%% Calculate the total average power of the process

total_average_power=FT_S_AC(2,2);