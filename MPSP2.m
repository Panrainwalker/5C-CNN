function [datan,px2n] = MPSP2(DATA,labels,px2)
%MPSP2 Move P and S phases
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Move P and S phases
% Data augment
% created by pyx
% 2023.1.7
% 针对事件2进行数据增广
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f=find(labels==2);
data1=DATA(:,:,f);

s3=size(data1,3);

for iii=1:s3
    
    a=round(rand(1,1)*29)+1;%a为正30
%     a=40;%a为正40
    for ii=1:36
        L=(1001-px2(:,ii,iii));
        LN=L+a;%正负50
        
        
        i=px2(:,ii,iii):1:1001-1;
        %         I=px1(:,ii,iii):dL:sx1(:,ii,iii)-1;
        I=linspace(px2(:,ii,iii),1001-1,LN);
        
        
        P=interp1(i,data1(i,ii,iii),I, 'linear');
        P=reshape(P,[size(P,2),1]);
        
        
        
        %S不动 移动P
        data1(1001-size(P,1)+1:1001,ii,iii)=P;
        datan(:,ii,iii)=data1(:,ii,iii);
        
        px2n(:,ii,iii)=1001-size(P,1)+1;
        
        
    end
end
[datan] = normalize(datan);
end

