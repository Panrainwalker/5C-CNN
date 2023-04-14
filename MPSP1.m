function [datan,px1n,sx1n] = MPSP1(DATA,labels,sx1,px1)
%MPSP1 Move P and S phases
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Move P and S phases
% Data augment
% created by pyx
% 2023.1.6
% 针对事件1进行数据增广
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f=find(labels==1);
data1=DATA(:,:,f);

s3=size(data1,3);

for iii=1:s3
    a=round(rand(1,1)*60-30);%a为正负30
    %            a=  -40;
    aa=round(rand(1,1)*200-100);%aa为正负100;% 正负决定是移动P还是移动S
    %           aa=-90;
    for ii=1:36
        L=(sx1(:,ii,iii)-px1(:,ii,iii));
        LN=L+a;%正负50
        
        
        i=px1(:,ii,iii):1:sx1(:,ii,iii)-1;
        %         I=px1(:,ii,iii):dL:sx1(:,ii,iii)-1;
        I=linspace(px1(:,ii,iii),sx1(:,ii,iii)-1,LN);
        
        
        P=interp1(i,data1(i,ii,iii),I, 'linear');
        P=reshape(P,[size(P,2),1]);
        
        if aa>=0%% 判断是移动P还是移动S
            
            %S不动 移动P
            if a>0 && min(px1(:,:,iii))>=50%S不动 移动P的条件
                
                data1(sx1(:,ii,iii)-size(P,1)+1:sx1(:,ii,iii),ii,iii)=P;
                datan(:,ii,iii)=data1(:,ii,iii);
                
                px1n(:,ii,iii)=sx1(:,ii,iii)-size(P,1)+1;
                sx1n(:,ii,iii)=sx1(:,ii,iii);
            elseif a==0
                
                datan(:,ii,iii)=data1(:,ii,iii);
                
                px1n(:,ii,iii)=px1(:,ii,iii);
                sx1n(:,ii,iii)=sx1(:,ii,iii);
            elseif a<0 && min(sx1(:,:,iii)-px1(:,:,iii))+a  >=80
                
                LNN=sx1(:,ii,iii)-size(P,1);
                
                %                 dLN=L/LNN;
                
                i=1:1:px1(:,ii,iii)-1;
                %                 IN=1:dLN:px1(:,ii,iii);
                IN=linspace(1,px1(:,ii,iii)-1,LNN);
                PN=interp1(i,data1(i,ii,iii),IN);
                PN=reshape(PN,[size(PN,2),1]);
                
                data1(sx1(:,ii,iii)-size(P,1)+1:sx1(:,ii,iii),ii,iii)=P;
                data1(1:length(PN),ii,iii)=PN;
                datan(:,ii,iii)=data1(:,ii,iii);
                
                px1n(:,ii,iii)=sx1(:,ii,iii)-size(P,1)+1;
                sx1n(:,ii,iii)=sx1(:,ii,iii);
            else
                L=(sx1(:,ii,iii)-px1(:,ii,iii));
                %                 a= 5 ;
                a=round(rand(1,1)*5);
                LN=L+a;
                
                
                i=px1(:,ii,iii):1:sx1(:,ii,iii)-1;
                %         I=px1(:,ii,iii):dL:sx1(:,ii,iii)-1;
                I=linspace(px1(:,ii,iii),sx1(:,ii,iii)-1,LN);
                
                
                P=interp1(i,data1(i,ii,iii),I, 'linear');
                P=reshape(P,[size(P,2),1]);
                
                data1(sx1(:,ii,iii)-size(P,1)+1:sx1(:,ii,iii),ii,iii)=P;
                datan(:,ii,iii)=data1(:,ii,iii);
                
                px1n(:,ii,iii)=sx1(:,ii,iii)-size(P,1)+1;
                sx1n(:,ii,iii)=sx1(:,ii,iii);
            end
            
            
        elseif aa<0
            %P不动 移动S
            if a>0 && max(sx1(:,:,iii))<=950%P不动 移动S的条件
                
                datan(:,ii,iii)=data1(:,ii,iii);
                datan(px1(:,ii,iii)+size(P,1):1001,ii,iii)=data1(sx1(:,ii,iii):1001-px1(:,ii,iii)-size(P,1)+sx1(:,ii,iii),ii,iii);
                datan(px1(:,ii,iii):px1(:,ii,iii)+size(P,1)-1,ii,iii)=P;
                
                
                px1n(:,ii,iii)=px1(:,ii,iii);
                sx1n(:,ii,iii)=px1(:,ii,iii)+size(P,1)+1;
                
            elseif a==0
                
                datan(:,ii,iii)=data1(:,ii,iii);
                
                px1n(:,ii,iii)=px1(:,ii,iii);
                sx1n(:,ii,iii)=sx1(:,ii,iii);
            elseif a<0 && min(sx1(:,:,iii)-px1(:,:,iii))+a  >=80
                L=1001-sx1(:,ii,iii);
                LNN=1001-(px1(:,ii,iii)+size(P,1));
                
                dLN=L/LNN;
                
                i=sx1(:,ii,iii):1:1001;
                %                 IN=sx1(:,ii,iii):dLN:1001;
                IN=linspace(sx1(:,ii,iii),1001,LNN);
                
                PN=interp1(i,data1(i,ii,iii),IN);
                PN=reshape(PN,[size(PN,2),1]);
                
                data1(1001-length(PN)+1:1001,ii,iii)=PN;
                data1(px1(:,ii,iii):px1(:,ii,iii)+size(P,1)-1,ii,iii)=P;
                datan(:,ii,iii)=data1(:,ii,iii);
                
                px1n(:,ii,iii)=sx1(:,ii,iii)-size(P,1)+1;
                sx1n(:,ii,iii)=sx1(:,ii,iii);
            else
                a=round(rand(1,1)*5);
                LN=L+a;%正负50
                dL=L/LN;
                
                i=px1(:,ii,iii):1:sx1(:,ii,iii);
                I=px1(:,ii,iii):dL:sx1(:,ii,iii);
                
                
                P=interp1(i,data1(px1(:,ii,iii):sx1(:,ii,iii),ii,iii),I);
                P=reshape(P,[size(P,2),1]);
                data1(sx1(:,ii,iii)-size(P,1)+1:sx1(:,ii,iii),ii,iii)=P;
                datan(:,ii,iii)=data1(:,ii,iii);
                
                px1n(:,ii,iii)=sx1(:,ii,iii)-size(P,1)+1;
                sx1n(:,ii,iii)=sx1(:,ii,iii);
            end
        end
    end
end
[datan] = normalize(datan);
end

