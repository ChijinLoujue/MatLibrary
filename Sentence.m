function output = Sentence( input,thresholds,MAX,MIN )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
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

