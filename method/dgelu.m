function [g] = dgelu(g,y)
%relu 激活函数
%   此处显示详细说明
    d = 0.5*tanh(0.0356774*y.^3 + 0.797885*y) + (0.0535161*y.^3 + 0.398942*y).*(sech(0.0356774*y.^3 + 0.797885*y)).^2 + 0.5;
    g = g.*d;
end
