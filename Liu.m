%����˼·��1.��xlsread������excel����е����ݵ���matlab��ע�⣬date��һ�кͱ�ͷ��һ�ж������룻
%2.����ά�Ⱦ�Ϊ261��X��Y��Obj�������ֱ𱣴�ÿһ�е����Թ滮������ֱ�Ϊ��weight_s,weight_gold,��Ŀ�꺯��ֵ
%3.���������ݴ���ھ���A�У�AΪ261*9����261�У���ѭ��261�Σ���i��ѭ��ȡA�ĵ�i�н��й滮
%4.ȡAÿ�еĺ�5�з���B�У���5����������Ŀ�꺯���ı��ʽ�еĲ���
%5.
%
%

clc
clear
A = xlsread('E:\LiuYH\Liu.xlsx','B2:J262'); %��excel����е������ݣ�date��һ�кͱ�ͷ��һ�ж������룻��E:\LiuYH\Liu.xlsx�������Լ��ı���ŵ�ַ��Ҫ�ĳ����Լ���
X=zeros(261,1);%��ʼ��X����ֵ��Ϊ0������ÿһ�е�weight_s
Y=zeros(261,1);%��ʼ��Y����ֵ��Ϊ0������ÿһ�е�weight_gold
Obj=zeros(261,1);%%��ʼ��Obj����ֵ��Ϊ0�������ÿһ�н��й滮����Ŀ�꺯������Сֵ
for i= 1:261 %A��261�У���261��ѭ��
B = A(i,[5:9]);%ȡAÿ�еĺ�5�з���B�У���5����������Ŀ�꺯���ı��ʽ�еĲ���
sigma_stock=B(1);  
sigma_gold=B(2);
Var_s=(sigma_stock^sigma_stock);% Var_sΪsigma_stock^2
Var_g = sigma_gold^sigma_gold;% Var_gΪsigma_gold^2
rou=B(3); %���ϵ��
cov=rou*sigma_stock*sigma_gold; %Э����
%
%
%����Ϊ��matlab�Դ���fmincon�����������Թ滮
%����ֻ��Լ������x+y=1,��0<=x,y<=1,����Լ�������ܺ�д
%����fmincon�����Լ�������ʽ���ο�
%https://ww2.mathworks.cn/help/optim/ug/fmincon.html#busog7r-fun
%�������о��������ʽ���������
%
%33~38�� Ϊ ����Լ����������
%Aeq��beqΪ���Ե�ʽԼ������
Aeq=[1 1]; %
beq=1;
% lb�� ubΪ�߽�Լ��
lb=[0,0]; %x��y���½�
ub=[1,1];%x��y���Ͻ�
x0=[0,0]; %x��y�ĳ�ʼֵ

fun=@(x)Var_s*x(1)^2 + Var_g*x(2)^2 +2*cov*x(1)*x(2);   %������������ʾ��Ŀ�꺯��
[x,y]=fmincon(fun,x0,[],[],Aeq,beq,lb,ub,[],[]);% xΪ1*2����������������ÿ�й滮�����Ž�ʱ��weight_s��weight_goldֵ��y�����Ź滮����Ŀ�꺯����Сֵ

%���滮���д��X��Y��Obj��Ӧλ��
X(i)=x(1);
Y(i)=x(2);
Obj(i)=y;
end
%���д��excel�� ͬ������ַҪ�ĳ����Լ���,,,������������һ���������������⣬�Լ��İɡ�����
%xlswrite('E:\LiuYH\Liu.xlsx',X,'Sheet1','K2��K262');
%xlswrite('E:\LiuYH\Liu.xlsx',Y,'Sheet1','L2:L262');
%xlswrite('E:\LiuYH\Liu.xlsx',Obj,'Sheet1','M2:M262');


