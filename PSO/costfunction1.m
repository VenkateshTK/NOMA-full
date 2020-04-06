function z= costfunction1(p)
    
    %h=[hx(2),hx(4),hx(3),hx(1)];
    
    h=[2,4,3,1];
    
    %p = p./10;
    
    c = [];
    
    c(1) = log2(1+(h(1)*p(1)/(h(1)*p(2)+h(1)*p(3)+1)));
    c(2) = log2(1+h(2)*p(2));
    c(3) = log2(1+(h(3)*p(3)/(h(3)*p(2)+1)));
    c(4) = log2(1+(h(4)*p(4)/(h(4)*p(1)+h(4)*p(2)+h(4)*p(3)+1)));
    
    c(5) = log2(1+(h(1)*p(4)/(h(1)*p(1)+h(1)*p(2)+h(1)*p(3)+1)));
    c(6) = log2(1+(h(2)*p(1)/(h(2)*p(3)+h(2)*p(2)+1)));
    c(7) = log2(1+(h(2)*p(3)/(h(2)*p(2)+1)));
    c(8) = log2(1+(h(2)*p(4)/(h(2)*p(3)+h(2)*p(2)+h(2)*p(1)+1)));
    c(9) = log2(1+(h(3)*p(4)/(h(3)*p(3)+h(3)*p(2)+h(3)*p(1)+1)));
    c(10) = log2(1+(h(3)*p(3)/(h(3)*p(2)+1)));
    
    c_pen = [];
   
    for i=1:length(c)
        if c(i)>1
            c_pen(i)=1;
        else
            c_pen(i)=0;
        end
    end
    
  
    x_pen = 0;
    if sum(p)>=1
        x_pen = 1;
    end
    
    if sum(p)<=1 
        x_pen = 1;
    end
    
    if sum(p)==1
        x_pen = 3;
    end
    
    
    c_penalty = 1000;
    x_penalty = 2000;
    
    %z = c(1)+c(2)+c(3)+c(4)+c_penalty*sum(c_pen)+x_pen*x_penalty;
    %z = x_pen*x_penalty;
    %z = c_penalty*sum(c_pen)+x_pen*x_penalty;
    z = c(1)+c(2)+c(3)+c(4)+c_penalty*sum(c_pen);
end