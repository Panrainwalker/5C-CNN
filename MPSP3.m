function [datan,sx3n] = MPSP3(DATA,labels,sx3)
%MPSP3 Move P and S phases
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Move P and S phases
% Data augment
% created by pyx
% 2023.1.7
% 针对事件3进行数据增广
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f=find(labels==3);
data1=DATA(:,:,f);

s3=size(data1,3);


for iii=1:s3
    
    a=round(rand(1,1)*19)+1;%a为正20
%     a=30;%a为40
    for ii=1:36
        L=sx3(:,ii,iii);
        LN=L+a;
        
        
        i=1:1:sx3(:,ii,iii)-1;
        %         I=px1(:,ii,iii):dL:sx1(:,ii,iii)-1;
        I=linspace(1,sx3(:,ii,iii)-1,LN);
        
        
        P=interp1(i,data1(i,ii,iii),I, 'linear');
        P=reshape(P,[size(P,2),1]);
        
        
        
        
        datan(:,ii,iii)=data1(:,ii,iii);
        datan(1+size(P,1):1001,ii,iii)=data1(sx3(:,ii,iii):1001-1-size(P,1)+sx3(:,ii,iii),ii,iii);
        datan(1:+size(P,1),ii,iii)=P;
        
        
      
        sx3n(:,ii,iii)=size(P,1);
        
        
        
    end

end
[datan] = normalize(datan);
end
