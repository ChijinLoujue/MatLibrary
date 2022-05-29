% ��ȡͼƬ�е���������
clear,clc,close all
%% ͼƬ�����߼�Ķ���
im=imread('D:\����\00.jpg');%����ͼƬ(�滻����Ҫ��ȡ���ߵ�ͼƬ)
im=rgb2gray(im);%�Ҷȱ仯
thresh = graythresh(im);%��ֵ����ֵ
im=im2bw(im,thresh);%��ֵ��
set(0,'defaultfigurecolor','w')
imshow(im)%��ʾͼƬ
[y,x]=find(im==0);%�ҳ�ͼ���еġ��ڵ㡱�����ꡣ��������һά���ݡ�
y=max(y)-y;%����Ļ����ת��Ϊ����ϵ�ѿ�������
y=fliplr(y);%fliplr()�������ҷ�ת����
plot(x,y,'r.','Markersize', 2);
disp('����Figrure���Ⱥ���ʵ����������������(���ϵ�����µ�)����A��B����. ');
[Xx,Yy]=ginput(2);%Xx,Yy����ָʵ����������������
min_x=input('��С��xֵ');%����x����Сֵ
max_x=input('����xֵ');%����x�����ֵ
min_y=input('��С��yֵ');%����y����Сֵ
max_y=input('����yֵ');%����y�����ֵ
x=(x-Xx(1))*(max_x-min_x)/(Xx(2)-Xx(1))+min_x;
y=(y-Yy(1))*(min_y-max_y)/(Yy(2)-Yy(1))+max_y;
plot(x,y,'r.','Markersize', 2);
axis([min_x,max_x,min_y,max_y])%���������������귶Χ
title('��ԭͼƬ�õ���δ����ɢ��ͼ')
%% ��ɢ��ת��Ϊ���õ�����
%�账�����������˼·
%(1)ɢ��ͼ�п���һ��x��Ӧ�ü���y <---> ����mean()-std()��mean()+std()֮���yֵ ��ȡƽ������
%(2)���ߵ���ǰ�˺����θ��Žϴ� <---> ȥ�����������ǰ(��5%)�ͺ�5%
%(3)���ߵ���˺���׶θ��Žϴ� <---> ȥ�������������10%����10%

%����Ԥ��
rate_x=0.08;%���ߵ���ǰ�˺�����ɾ������
rate_y=0.05;%���ߵ���˺���׶�ɾ������

[x_uni,index_x_uni]=unique(x);%�ҳ��ж��ٸ���ͬ��x����

x_uni(1:floor(length(x_uni)*rate_x))=[];%��ȥǰrate_x(��5%)��x����
x_uni(floor(length(x_uni)*(1-rate_x)):end)=[];%��ȥ��rate_x��x����
index_x_uni(1:floor(length(index_x_uni)*rate_x))=[];%��ȥǰrate_x��x����
index_x_uni(floor(length(index_x_uni)*(1-rate_x)):end)=[];%��ȥ��rate_x��x����

[mxu,~]=size(x_uni);
[mx,~]=size(x);
for ii=1:mxu
    if ii==mxu
        ytemp=y(index_x_uni(ii):mx);
    else
        ytemp=y(index_x_uni(ii):index_x_uni(ii+1));
    end
    %ɾ�����������쳣��
    threshold1=mean(ytemp)-std(ytemp);
    threshold2=mean(ytemp)+std(ytemp);
    ytemp(find(ytemp<threshold1))=[];%ɾ��ͬһ��x��Ӧ��һ��y�е��쳣��
    ytemp(find(ytemp>threshold2))=[];
    %ɾ���ඥ�˺͵׶˽Ͻ��ĵ�
    thresholdy=(max_y-min_y)*rate_y;%y��������ֵ
    ytemp(find(ytemp>max_y-thresholdy))=[];%ɾ��y������붥����׶˾���С��rate_y������
    ytemp(find(ytemp<min_y+thresholdy))=[];
    %ʣ�µ�y���ֵ
    y_uni(ii)=mean(ytemp);
end
%��ʱ�ܶ�x_uni�㴦��Ӧ��y_uniΪ��,��NAN,Ҫ��һ��ɾȥ��Щ�յ�
x_uni(find(isnan(y_uni)))=[];
y_uni(find(isnan(y_uni)))=[];
%��ͼ
figure,plot(x_uni,y_uni),title('�������õ���ɨ������')
axis([min_x,max_x,min_y,max_y])%���������������귶Χ
% ��������ȡ����x��y���ݱ���
curve_val(1,:)=x_uni';
curve_val(2,:)=y_uni;
%% ����ȡ�������ݽ������(��ʵ����������޸�)
[p,s]=polyfit(curve_val(1,:),curve_val(2,:),4);%����ʽ���(Ϊ�����������,����ʽ��Ͻ�������̫��)
[y_fit,DELTA]=polyval(p,x_uni,s);%����Ϻ����ʽ��x_uni��Ӧ��y_fitֵ
figure,plot(x_uni,y_fit),title('��Ϻ������')
axis([min_x,max_x,min_y,max_y])%���������������귶Χ