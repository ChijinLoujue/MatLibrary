% Function File: serial2parallel.m
function y = serial2parallel(x,N)
%
%
%
length_x=length(x);
temp_residue=rem(length_x,N);
temp_y=x;
if temp_residue~=0                % add elements to x,  so that the result of length(x)/4 is integer
    for k=1:N-temp_residue
        temp_y=[temp_y 0];
    end
end
for k=1:length(temp_y)/N
    for j=1:N
        y(k,j)=temp_y((k-1)*N+j);
    end
end