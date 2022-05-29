function y=parallel2serial(x)
x=x';
[M, N] = size(x);
y=zeros(1,M*N);
 y = x(1,:);
for m=2:M
    y = [y x(m,:)];
end