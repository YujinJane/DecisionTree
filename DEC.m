function [z,count1] = DEC(attrib,label1,a)
count1 = zeros(2,3);
n1 = length(attrib);
for i = 1:n1
    if label1(i) == 0
        if a(i) == 1
            count1(1,1) = count1(1,1)+1;
        end
        if a(i) == 2
            count1(1,2) = count1(1,2)+1;
        end
        if a(i) == 3
            count1(1,3) = count1(1,3)+1;
        end
    end
    if label1(i) ==1
       if a(i) == 1
            count1(2,1) = count1(2,1)+1;
        end
        if a(i) == 2
            count1(2,2) = count1(2,2)+1;
        end
        if a(i) == 3
            count1(2,3) = count1(2,3)+1;
        end
    end
end

z = zeros(1,2);
for i = 1:2
    for j = 1:3
        if count1(i,j) == 0
          z(i) = z(i)+1;
        end
    end
end
