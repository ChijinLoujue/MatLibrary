function  output = Sample( input,Fm,Fs )
%Sample:��input��Ԫ���в���
%���룺
%	input	-->		������Ԫ����
%	Fm		-->		��Ԫ����
%	Fs		-->		��������
%�����
%	output	-->		�����Ԫ����
%********************************************
[Chancel,inputLength]=size(input);
Ns=Fs/Fm;  %����Ԫ��������
output=zeros(Chancel,Ns*inputLength);
for i=1:Chancel
    for j=1:inputLength
         output(i,(j-1)*Ns+1:j*Ns)=ones(1,Ns).*input(i,j);
    end
end
end

