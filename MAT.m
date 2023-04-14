function [x] = MAT(DATA,labels,n,a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MAT mark arrival time
% created by pyx
% 2023.1.6
% �ɶ�12���������첨���ĵ�ʱ���б��
%  x Ϊ��ȡ�ĵ�ʱ�ĺ�����
%  n Ϊ��Ҫ��ȡ���¼����
%  a Ϊ��Ҫ��ȡ�ĵ�a���¼�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=find(labels==n);
data1=DATA(:,:,f);

% f=find(labels==2);
% data2=DATA(:,:,f);
% 
% f=find(labels==3);
% data3=DATA(:,:,f);
% 
% f=find(labels==4);
% data4=DATA(:,:,f);

%% ��ȡ�¼�1��P��S����ʱ
% a = 7 ;    %�����¼��ǵ�a��
plot_microseismic(data1(:,:,a),12);
for i=1:12%12����ѭ��

    for ii=1:100%Ԥ������ѭ��
        hold on
        y=input('(1-12),����P or S����ʱ��yֵ=');
        x=input('(1-1001),����P or S����ʱ��xֵ=');

%         plot(x,y*2,'mo','MarkerSize',10);
        plot(x,y*2,'mo','MarkerSize',10,'Markerfacecolor','m');

        t=input('ȷ�����������,�����롾����0/��ȷ1��');
        if t==1
            p(1+(i-1)*3:3+(i-1)*3)=x;
            break;

        else
            x=[];
            y=[];
        end

    end
end
close all;

x=p;

end

