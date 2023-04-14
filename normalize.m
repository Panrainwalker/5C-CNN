% function [data] = normalize(DATA)
% %Version 2022.12.31
% %NORMALIZE 归一化
% %把三分量分别归一化，不同的分量不会相互影响
% % n=size(DATA,3);%样本数
% % c=size(DATA,2);%36
% % r=size(DATA,1);%1001
% % for ii=1:n
% %     dataa=DATA(:,:,ii);
% %     
% %     for i=1:3%三分类分别拎出来
% %         k=1;
% %         for iiii=1:12
% %             DATAnorm(:,k,i)=dataa(:,i+(iiii-1)*3);
% %             k=k+1;
% %         end
% %     end
% %     
% %     k=1;
% %     for a=1:3%3分量分别的最大值
% %         Max(k)=max(max(DATAnorm(:,:,a)));
% %         k=k+1;
% %     end
% %     
% %     for b=1:3%3分量归一化
% %         DATAmax(:,:,b,ii)=DATAnorm(:,:,b)./Max(b);
% %     end
% %     
% %     
% %     k=1;
% %     for bb=1:12 %3分量变回36
% %         for aaa=1:3
% %             D(:,k,ii)=DATAmax(:,bb,aaa,ii);
% %             k=k+1;
% %         end
% %     end
% % end
% % 
% % data=D;%归一化
% % end
function [D] = normalize(DATA)
%Version 2022.12.31
%NORMALIZE 归一化
%不是按照12道的最大值，而是按照每一个检波器的最大值来归一化

n=size(DATA,3);%样本数
c=size(DATA,2);%36
for ii=1:n
    dataa=DATA(:,:,ii);
    
    for i=1:3%三分类分别拎出来
        k=1;
        for iiii=1:c/3
            DATAnorm(:,k,i)=dataa(:,i+(iiii-1)*3);
            k=k+1;
        end
    end
    %%
    
    for i=1:12
        for a=1:3%3分量分别的最大值
            Max(i,a)=max(abs(DATAnorm(:,i,a)));
        end
    end
    
    
    %%
    for i=1:12
        for b=1:3%3分量归一化
            DATAmax(:,i,b,ii)=DATAnorm(:,i,b)./Max(i,b);
        end
    end
    
    k=1;
    for bb=1:c/3 %3分量变回36
        for aaa=1:3
            D(:,k,ii)=DATAmax(:,bb,aaa,ii);
            k=k+1;
        end
    end
    
end

