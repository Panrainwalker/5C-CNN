function [data] = CE4(DATA,labels,px1,sx1,px2,sx3,N)
%CE4 Create Event4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data augment
% created by pyx
% 2023.1.7
% ����¼�4������������
% NΪ��Ҫ���ɵ��¼�4�ĸ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f1=find(labels==1);
data1=DATA(:,:,f1);
f2=find(labels==2);
data2=DATA(:,:,f2);
f3=find(labels==3);
data3=DATA(:,:,f3);

n1=size(data1,3);%�¼�1����
n2=size(data2,3);
n3=size(data3,3);


%�¼�1���¼�2
k1=1;
for ii=1:10000
    r1=randi([1 n1]);%���ѡ��һ���¼�1
    r2=randi([1 n2]);%���ѡ��һ���¼�2
    if max(sx1(:,:,r1)) <=800
        a1=0.3*rand(1)+0.7;
        a2=0.3*rand(1)+0.7;
        data(:,:,k1)=a1*data1(:,:,r1)+a2*data2(:,:,r2);
        k1=k1+1;
        if k1==round(N/5)+1
            k1=k1-1;
            break
        end
    end
end


%�¼�1���¼�3
k2=1;
for ii=1:10000
    r1=randi([1 n1]);%���ѡ��һ���¼�1
    if min(px1(:,:,r1)) >=250
        r3=randi([1 n3]);%���ѡ��һ���¼�2
        a1=0.3*rand(1)+0.7;
        a2=0.3*rand(1)+0.7;
        %         data(:,:,k1+k2)=data1(:,:,r1)+a*data3(:,:,r3);
        data(:,:,k1+k2)=a1*data1(:,:,r1)+a2*data3(:,:,r3);
        k2=k2+1;
        if k2==round((N)/5)+1
            k2=k2-1;
            break
        end
    end
end

%�¼�1���¼�1
k3=1;
for ii=1:10000
    r11=randi([1 n1]);%���ѡ��һ���¼�1
    r12=randi([1 n1]);%���ѡ��һ���¼�1
    if min(px1(:,:,r11)-px1(:,:,r12)) >=200
        
        %         a=rand(1)+0.3;
        %         data(:,:,k1+k2+k3)=data1(:,:,r11)+data1(:,:,r12);
        a1=0.5*rand(1)+0.5;
        a2=0.5*rand(1)+0.5;
        data(:,:,k1+k2+k3)=a1*data1(:,:,r11)+a2*data1(:,:,r12);
        k3=k3+1;
        if k3==N-k2-k1
            break
        end
    end
end
[data] = normalize(data);

end






















