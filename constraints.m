function z=constraints(p)
    h=[2,4,3,1];
    c1 = log2(1+(h(1)*p(1)/(h(1)*p(2)+h(1)*p(3)+1)));
    c2 = log2(1+h(2)*p(2));
    c3 = log2(1+(h(3)*p(3)/(h(3)*p(2)+1)));
    c4 = log2(1+(h(4)*p(4)/(h(4)*p(1)+h(4)*p(2)+h(4)*p(3)+1)));
    %x1 = log2(1+(h(1)*p(4)/(h(1)*p(1)+h(1)*p(2)+h(1)*p(3)+1)));
    %x2 = log2(1+(h(2)*p(1)/(h(2)*p(3)+h(2)*p(2)+1)));
    %x3 = log2(1+(h(2)*p(3)/(h(2)*p(2)+1)));
    %x4 = log2(1+(h(2)*p(4)/(h(2)*p(3)+h(2)*p(2)+h(2)*p(1)+1)));
    %x5 = log2(1+(h(3)*p(4)/(h(3)*p(3)+h(3)*p(2)+h(3)*p(1)+1)));
    %x6 = log2(1+(h(3)*p(3)/(h(3)*p(2)+1)));
    if c1>1 & c2 >1 & c3 >1 & c4>1 
        z = 1;
    else 
        z = 0;
    end
end