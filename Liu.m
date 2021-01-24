%程序思路，1.用xlsread函数将excel表格中的内容导入matlab，注意，date这一列和表头这一行都不导入；
%2.生成维度均为261的X，Y，Obj向量来分别保存每一行的线性规划结果。分别为：weight_s,weight_gold,和目标函数值
%3.导入后的数据存放在矩阵A中，A为261*9，共261行，故循环261次，第i次循环取A的第i行进行规划
%4.取A每行的后5列放在B中，后5列数据在是目标函数的表达式中的参数
%5.
%
%

clc
clear
A = xlsread('E:\LiuYH\Liu.xlsx','B2:J262'); %从excel表格中导入数据，date这一列和表头这一行都不导入；‘E:\LiuYH\Liu.xlsx’是我自己的表格存放地址，要改成你自己的
X=zeros(261,1);%初始化X，初值均为0，保存每一行的weight_s
Y=zeros(261,1);%初始化Y，初值均为0，保存每一行的weight_gold
Obj=zeros(261,1);%%初始化Obj，初值均为0，保存对每一行进行规划所得目标函数的最小值
for i= 1:261 %A共261行，故261次循环
B = A(i,[5:9]);%取A每行的后5列放在B中，后5列数据在是目标函数的表达式中的参数
sigma_stock=B(1);  
sigma_gold=B(2);
Var_s=(sigma_stock^sigma_stock);% Var_s为sigma_stock^2
Var_g = sigma_gold^sigma_gold;% Var_g为sigma_gold^2
rou=B(3); %相关系数
cov=rou*sigma_stock*sigma_gold; %协方差
%
%
%以下为用matlab自带的fmincon函数进行线性规划
%由于只有约束条件x+y=1,和0<=x,y<=1,所以约束条件很好写
%关于fmincon函数以及参数格式，参考
%https://ww2.mathworks.cn/help/optim/ug/fmincon.html#busog7r-fun
%这里面有矩阵参数格式，对着填即可
%
%33~38行 为 定义约束条件矩阵
%Aeq和beq为线性等式约束条件
Aeq=[1 1]; %
beq=1;
% lb和 ub为边界约束
lb=[0,0]; %x和y的下界
ub=[1,1];%x和y的上界
x0=[0,0]; %x和y的初始值

fun=@(x)Var_s*x(1)^2 + Var_g*x(2)^2 +2*cov*x(1)*x(2);   %用匿名函数表示的目标函数
[x,y]=fmincon(fun,x0,[],[],Aeq,beq,lb,ub,[],[]);% x为1*2的行向量。保存着每行规划后最优解时的weight_s和weight_gold值，y保存着规划所得目标函数最小值

%将规划结果写入X，Y，Obj对应位置
X(i)=x(1);
Y(i)=x(2);
Obj(i)=y;
end
%结果写会excel表 同样，地址要改成你自己的,,,这个函数我最后一个参数设置有问题，自己改吧。。。
%xlswrite('E:\LiuYH\Liu.xlsx',X,'Sheet1','K2：K262');
%xlswrite('E:\LiuYH\Liu.xlsx',Y,'Sheet1','L2:L262');
%xlswrite('E:\LiuYH\Liu.xlsx',Obj,'Sheet1','M2:M262');


