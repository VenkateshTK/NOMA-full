clc;
clear;
close all;

n=10
s=0;
for p1 = 1:n
    for p2 = 1:n
        for p3 = 1:n
          for p4 = 1:n
              s = s+constraints([p1,p2,p3,p4]);
              if constraints([p1,p2,p3,p4])
                  p1
                  p2
                  p3
                  p4
              end
          end
        end
    end 
end
