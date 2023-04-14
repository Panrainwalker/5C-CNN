function cheakevent(DATA,labels,L,n,s,e)
% Version 2022.12.31
%CHEAKEVENT 检查数据与标签是否匹配
% DATA为数据
% labels为标签
% L为需要检查的标签?号
% n、s、e分别为 分成的份数、开始的乘数、结束的乘数
%
% 如：若要把数据分成4份，先检查第1到第2份，则n=4，start=0、end=1
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
        for i=1:12   %加i是为了分离12个地震道的数据
            plot(DATA1(:,3*i-2)+2*i,'r');%分量1
            hold on;
            plot(DATA1(:,3*i-1)+2*i,'b');%分量2
            hold on;
            plot(DATA1(:,3*i)+2*i,'g');%分量3
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
        for i=1:12   %加i是为了分离12个地震道的数据
            plot(DATA1(:,3*i-2)+2*i,'r');%分量1
            hold on;
            plot(DATA1(:,3*i-1)+2*i,'b');%分量2
            hold on;
            plot(DATA1(:,3*i)+2*i,'g');%分量3
            hold on
        end
        set(gca,'YDir','reverse');
    end
end
end

