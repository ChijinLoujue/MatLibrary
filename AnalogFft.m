function [F,output] = AnalogFft( input,Fs )

%Fs=10^6;
L=length(input);
Ts=1/Fs;
S=input;

Y=fft(S);
P2=abs(Y/L);
P1=2*P2(1:L/2);
P1=20*log10(P1);
F=Fs*(0:L/2-1)/L;
output=P1;
end

