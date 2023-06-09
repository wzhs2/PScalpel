function [g] = dselu(g,y)
%relu 激活函数
%   此处显示详细说明
    alpha = 1.6732632423543772848170429916717;
    scale = 1.0507009873554804934193349852946;
    p = (y > 0);
    d = scale*p + (y+alpha*scale).*(1-p);
    g = d.*g;
end

