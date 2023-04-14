function [C4] = TC2_4E(DATA,labels,sx1,px1,n)
%Truncate C2 event to create C4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data augment
% created by pyx
% 2023.3.9
% 针对事件3、4进行数据增广（截取C2事件）

%输入的数据类型：  DATA是总数据集；
%               labels是总标签；
%               sx1是s波到时标签；
%               px1是p波到时标签；
%               n为希望生生成的C4事件数目；
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 获取事件2
label1 = find(labels==1);   % 找到事件2所在位置
data = DATA(:,:,label1);    % data是全部事件2的数据集



c=1;
C4=zeros(1001,36,1);
for ii=1:1000000
    %% 获取P波、S波到时信息
    a = randi([1, size(data,3)]);    % 随机选择整数
    P = px1(1,1,a);      % 最后的P波相位到时
    S = sx1(1,1,a);      % 最后的S波相位到时
    Pq = px1(1,36,a);    % P波最初到时
    Sq = sx1(1,36,a);    % S波最初到时
    W1 = round((P+Sq)/2);  % 选择截取的窗口
    as = -40;   % 指定范围的下限
    bs = 40;    % 指定范围的上限
    r = round(as + (bs-as).*rand(1,1)); % 生成随机数
    W = W1+r;  % 生成随机扰动
    %% 截取窗口，划分C3、C4事件
    %     C30=data(Pq:W-1,:,a);      % 划分C3事件
    C40=data(W+1:S,:,a);  % C4事件
    
    %% 补全窗口，获得完整C3、C4事件
    if W<=500 %为了选择插值的噪声
        
        %%获得完整C4事件
        L=1001-(S-W);             % 需要补全的长度
        I=linspace(S,1001,L);   % 向量I 长为 L，I中每个元素均匀地分布在 1 到 Pq 之间。
        
        i=S:1001;    %已知数据点的横坐标
        SS=interp1(i,data(i,:,a),I, 'linear');  %线性插值
        C41 = vertcat(C40, SS);  % 拼接两个矩阵 C30与P
        if C4==zeros(1001,36,1)  % 判断是否是第一次
            C4 = C41;
        else
            C4= cat(3, C4, C41); % 拼接两个矩阵
        c=c+1; % 计数
    end
    if c==n+1
        break;
    end
end
end



