function output = samplingInterval( input,Fs,Fm )
%UNTITLED4 此处显示有关此函数的摘要
%   ,
Interval=round(Fs/Fm);
[chancal,inputLength]=size(input);
N=floor(inputLength/Interval);
output = zeros(chancal,N);
for i=1:N
    output(:,i)=input(:,(i-1)*Interval+round(Interval/2));
end

end

