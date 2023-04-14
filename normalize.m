% function [data] = normalize(DATA)
% %Version 2022.12.31
% %NORMALIZE ��һ��
% %���������ֱ��һ������ͬ�ķ��������໥Ӱ��
% % n=size(DATA,3);%������
% % c=size(DATA,2);%36
% % r=size(DATA,1);%1001
% % for ii=1:n
% %     dataa=DATA(:,:,ii);
% %     
% %     for i=1:3%������ֱ������
% %         k=1;
% %         for iiii=1:12
% %             DATAnorm(:,k,i)=dataa(:,i+(iiii-1)*3);
% %             k=k+1;
% %         end
% %     end
% %     
% %     k=1;
% %     for a=1:3%3�����ֱ�����ֵ
% %         Max(k)=max(max(DATAnorm(:,:,a)));
% %         k=k+1;
% %     end
% %     
% %     for b=1:3%3������һ��
% %         DATAmax(:,:,b,ii)=DATAnorm(:,:,b)./Max(b);
% %     end
% %     
% %     
% %     k=1;
% %     for bb=1:12 %3�������36
% %         for aaa=1:3
% %             D(:,k,ii)=DATAmax(:,bb,aaa,ii);
% %             k=k+1;
% %         end
% %     end
% % end
% % 
% % data=D;%��һ��
% % end
function [D] = normalize(DATA)
%Version 2022.12.31
%NORMALIZE ��һ��
%���ǰ���12�������ֵ�����ǰ���ÿһ���첨�������ֵ����һ��

n=size(DATA,3);%������
c=size(DATA,2);%36
for ii=1:n
    dataa=DATA(:,:,ii);
    
    for i=1:3%������ֱ������
        k=1;
        for iiii=1:c/3
            DATAnorm(:,k,i)=dataa(:,i+(iiii-1)*3);
            k=k+1;
        end
    end
    %%
    
    for i=1:12
        for a=1:3%3�����ֱ�����ֵ
            Max(i,a)=max(abs(DATAnorm(:,i,a)));
        end
    end
    
    
    %%
    for i=1:12
        for b=1:3%3������һ��
            DATAmax(:,i,b,ii)=DATAnorm(:,i,b)./Max(i,b);
        end
    end
    
    k=1;
    for bb=1:c/3 %3�������36
        for aaa=1:3
            D(:,k,ii)=DATAmax(:,bb,aaa,ii);
            k=k+1;
        end
    end
    
end

