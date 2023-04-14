function [ANS]=AN_23_4_2(DATA,labels,noises,a,N)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add noise using 4 different tpyes of noises
% Data augment
% created by pyx
% 2023.4.2
% aΪ��Ҫ����������¼����
% NΪ��Ҫ����ĸ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



noises = normalize(noises);
f=find(labels==a);
DATA=DATA(:,:,f);

L=size(DATA,3);
re = randi([1 L],1,2*N);%���ѡ��N�¼�

k=1;

% ��ӽ�ȡ����
nn=size(noises,3);%����������
for ii = 1:round(N/2)
    r=randi([1 nn]);%���ѡ��һ������
    SNR= 1 + (3-1)*rand(1,1); %choose the SNR (range from 4 to 1)
    Noise=noises(:,:,r)./SNR;
    ANS(:,:,k)=Noise+DATA(:,:,re(k));
    k=k+1;
end


% ��Ӹ�˹������

for ii=1:round(N/6)
    a = 0.0005 + (0.005-0.0005)*rand(1,1);% (0.05-0.005��
    noise = a* rand(1001, 36);
    ANS(:,:,k)= noise +DATA(:,:,re(k));
    k=k+1;
    
end



% �����������
for ii = 1:round(N/6)
    prob = 0.0005 + (0.005-0.0005)*rand(1,1);% ������ֵĸ���(0.005-0.0005)
    noise1 = rand(1001, 36);
    noise1(noise1 < prob) = 1;
    noise1(noise1 ~= 1) = 0;
    noise2 = rand(1001, 36);
    noise2(noise2 > (1-prob)) = -1;
    noise2(noise2 ~= -1) = 0;
    noise = noise1 + noise2;
    % ����������ź�
    ANS(:,:,k) = noise+DATA(:,:,re(k));
    k = k +1;
end


t_step = 5e-4; % �������
% ������Ҳ�����
for ii = 1:round(N/6)
    freq = 3 + (6-3)*rand(1,1); %Ƶ�� (range from 3 to 6)
    amp = 0.05 + (0.3-0.05)*rand(1,1); %���Ҳ����(range from 0.05 to 0.3)
    t = 0:t_step:(1000*t_step); % ʱ������
    noise = amp * sin(2 * pi * freq * t);
    
    noise_matrix = repmat(noise, 36, 1);% ���������������ź�ͨ��
    noise_matrix = noise_matrix.';
    ANS(:,:,k)= noise_matrix +DATA(:,:,re(k));
    k = k + 1;
    
end

[ANS] = normalize(ANS);



end











