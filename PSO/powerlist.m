clear all;
out = [];
for x = 1:30
    y = x/20;
    out(x) = 10^(y);
    %out(x).*10
end
out