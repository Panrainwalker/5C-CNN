function [dR] = RC(DATA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rotate the components
% Data augment
% created by pyx
% 2022.6.20
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% DATA(:,:,1)=[];

%% seperate 3 component of the receiver (1001,36)-->(1001,12,3)
n=size(DATA,3);% the number of samples

for ppp=1:n
    for ii=1:12
        for jj=1:3
            a(:,ii,jj,ppp)=DATA(:,(ii-1)*3+jj,ppp);
        end
    end
end
dx=a(:,:,1,:);
dy=a(:,:,2,:);
dz=a(:,:,3,:);
%%  Rotate the components

% phi=45; theta=45; var=45;
phi= 1 + (360-1)*rand(1,1); %range from 1 to 360
theta=1 + (360-1)*rand(1,1); %range from 1 to 360
var=1 + (90-1)*rand(1,1); %range from 1 to 90

% phi= 1 + (30-1)*rand(1,1); %range from 1 to 30
% theta=1 + (30-1)*rand(1,1); %range from 1 to 30
% var=1 + (10-1)*rand(1,1); %range from 1 to 10

T=[cos(phi).*cos(theta),cos(theta).*sin(phi),   -sin(theta);...
    cos(phi).*sin(var).*sin(theta),cos(var).*cos(phi)+sin(var).*sin(phi).*sin(theta),cos(theta).*sin(var);...
    sin(var).*sin(phi)+cos(var).*cos(phi).*sin(theta),cos(var).*sin(phi).*sin(theta)-cos(phi).*sin(phi),cos(var).*cos(theta)];

dR1=T(1,1)*dx+T(1,2)*dy+T(1,3)*dz;
dR2=T(2,1)*dx+T(2,2)*dy+T(2,3)*dz;
dR3=T(3,1)*dx+T(3,2)*dy+T(3,3)*dz;

dR=cat(3,dR1,dR2,dR3);



%% change back (1001,12,3)-->(1001,36)
for k=1:n
    for ii=1:12
        for jj=1:3
            aaa(:,jj+(ii-1)*3,k)=dR(:,ii,jj,k);
        end
    end
end
dR=aaa ;% get the reversed data- aa (1001,36,n)
[dR] = normalize(dR);
end















