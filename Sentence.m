function output = Sentence( input,thresholds,MAX,MIN )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
N=length(input);
output=zeros(1,N);
for  i=1:N
    if  input(i)>=thresholds
      output(i)=MAX;
    else 
      output(i)=MIN;
    end
end

end

