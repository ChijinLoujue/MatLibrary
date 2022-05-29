function  [freq, output] = PSDplot( x,Fs )
%功率谱密度图
%freq: 频率范围，横坐标
%output: 功率密度
%x: 原信号
%Fs: 采样率
N = length(x);
xdft = fft(x);
xdft = xdft(1:N/2+1);
psdx = (1/(Fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:Fs/length(x):Fs/2;
output = 10*log10(psdx);
plot(freq,output)
grid on
title('Periodogram Using FFT')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')
end