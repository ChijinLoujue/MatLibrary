function  output = Sample( input,Fm,Fs )
%Sample:对input码元进行采样
%输入：
%	input	-->		输入码元序列
%	Fm		-->		码元速率
%	Fs		-->		采样速率
%输出：
%	output	-->		输出码元序列
%********************************************
[Chancel,inputLength]=size(input);
Ns=Fs/Fm;  %单码元采样点数
output=zeros(Chancel,Ns*inputLength);
for i=1:Chancel
    for j=1:inputLength
         output(i,(j-1)*Ns+1:j*Ns)=ones(1,Ns).*input(i,j);
    end
end
end

