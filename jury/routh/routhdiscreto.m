function [] = routhdiscreto(Gz)
syms z
[num,den]=tfdata(Gz);
Gz
p(z) = poly2sym(cell2mat(num),z)/poly2sym(cell2mat(den),z);
syms w
Gw=p((w+1)/(w-1));
Gw=simplify(Gw);
[num,den]=numden(Gw);
num=sym2poly(num);
den=sym2poly(den);
routh(den)
end

