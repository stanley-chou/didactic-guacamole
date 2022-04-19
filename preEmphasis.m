function [y] = preEmphasis(v)
%applies preEmphasis to the signal
v = v(:,1);
y = v;
c = 0.98;

for n= 2:length(v)
    y(n) = v(n) - c*v(n-1);
end
end

