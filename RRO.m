function [DATAr,labelsr] = RRO2(DATA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reverse the receiver order
% Data augment
% created by pyx
% 2022.6.20
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DATA(:,:,1)=[];    %the first sample is empty

%% seperate 3 component of the receiver (1001,36)-->(1001,12,3)
n=size(DATA,3);% the number of samples

for ppp=1:n
    for ii=1:12
        for jj=1:3
            a(:,ii,jj,ppp)=DATA(:,(ii-1)*3+jj,ppp);
        end
    end
end

%% Reverse the receiver order
aa=a;

for jj=1:n
    for ii=1:6
        p=a(:,12-ii+1,:,jj);
        pp=a(:,ii,:,jj);
        aa(:,ii,:,jj)=p;
        aa(:,12-ii+1,:,jj)=pp;
    end
end


aa;% get the reversed data- aa (1001,12,3,n)

%% change back (1001,12,3)-->(1001,36)
for k=1:n
    for ii=1:12
        for jj=1:3
            aaa(:,jj+(ii-1)*3,k)=aa(:,ii,jj,k);
        end
    end
end
DATAr=aaa ;% get the reversed data- aa (1001,36,n)

end

