function cheakevent(DATA,labels,L,n,s,e)
% Version 2022.12.31
%CHEAKEVENT ����������ǩ�Ƿ�ƥ��
% DATAΪ����
% labelsΪ��ǩ
% LΪ��Ҫ���ı�ǩ?��
% n��s��e�ֱ�Ϊ �ֳɵķ�������ʼ�ĳ����������ĳ���
%
% �磺��Ҫ�����ݷֳ�4�ݣ��ȼ���1����2�ݣ���n=4��start=0��end=1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[D] = normalize(DATA);
DATA=D;
f=find(labels==L);
if s==0
    for ii=round(1:e*length(f)/n)
        figure(f(ii))
        DATA1=DATA(:,:,f(ii));
        DATA_max = 0;
        DATA_max=max(DATA_max,max(DATA1(:,:)));
        for i=1:12   %��i��Ϊ�˷���12�������������
            plot(DATA1(:,3*i-2)+2*i,'r');%����1
            hold on;
            plot(DATA1(:,3*i-1)+2*i,'b');%����2
            hold on;
            plot(DATA1(:,3*i)+2*i,'g');%����3
            hold on
        end
        set(gca,'YDir','reverse');
    end
else
    for ii=round(s*length(f)/n:e*length(f)/n)
        figure(f(ii))
        DATA1=DATA(:,:,f(ii));
        DATA_max = 0;
        DATA_max=max(DATA_max,max(DATA1(:,:)));
        for i=1:12   %��i��Ϊ�˷���12�������������
            plot(DATA1(:,3*i-2)+2*i,'r');%����1
            hold on;
            plot(DATA1(:,3*i-1)+2*i,'b');%����2
            hold on;
            plot(DATA1(:,3*i)+2*i,'g');%����3
            hold on
        end
        set(gca,'YDir','reverse');
    end
end
end

