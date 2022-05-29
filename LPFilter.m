function output = LPFilter( input,Fs,Fp )
%LPFilter 此处显示有关此函数的摘要
%   此处显示详细说明：
%
% 输入：
% input 	-->		输入序列
% Fs    	-->		采样率
% Fp    	-->		截止频率5MHz
% 输出：
% output	-->		输出序列
%********************************************

Wp=Fp/(Fs/2);%归一化截至频率

Wtran=0.1*Wp;
N=ceil(6.6*pi/(Wtran*pi));
if mod(N,2)==0
    N=N+1;
end
%n=0:N-1;
h=fir1(N-1,Wp,'Low',hamming(N));
%% ***********************************
% Ts=1/Fs;
% fc1=7*10^6;
% fc2=3*10^6;
% Length1=Fs/fc1*100;
% t=0:Ts:(Length1-1)*Ts;%仿真时长


% Wc1=cos(2*pi*fc1*t);
% Wc2=cos(2*pi*fc2*t);
% Signal =Wc1+Wc2;
Signal=input;
Signalout=conv(Signal,h);
Redundant=(N-1)/2;
Signalout=Signalout(Redundant+1:length(Signalout)-Redundant);
output=Signalout;
end

