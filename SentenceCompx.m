function output = SentenceCompx( input )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
N=length(input);
output=zeros(2,N);
for  i=1:N
    if ( phase(input(i))>=-pi/4&& phase(input(i))<pi/4)
      output(:,i)=[0;0];
    elseif ( phase(input(i))>=pi/4&& phase(input(i))<3*pi/4)
      output(:,i)=[0;1];
    elseif ( phase(input(i))>=3*pi/4|| phase(input(i))<-3*pi/4)
      output(:,i)=[1;0];
    elseif ( phase(input(i))>=-3*pi/4&& phase(input(i))<-pi/4)
      output(:,i)=[1;1];
     end
end

end


