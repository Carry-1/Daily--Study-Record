function f=fun_Obj(x)
sigma_stock=B(1);
sigma_gold=B(2);
global Var_s ;
Var_s=(sigma_stock^sigma_stock);% Var_sΪsigma_stock^2
global Var_g ;
Var_g = sigma_gold^sigma_gold;% Var_gΪsigma_gold^2
f = Var_s*x(1)^2 + Var_g*x(2)^2 +2*cov*x(1)*x(2);
end