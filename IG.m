function [GA,ent,p] = IG(mp,gp,x_attrib,a,T)
n = length(x_attrib);
n1 = 0;
n2 = 0;
n3 = 0;
pro1m = zeros(1,n-1);
pro2m = zeros(1,n-1);
pro3m = zeros(1,n-1);
pro1g = zeros(1,n-1);
pro2g = zeros(1,n-1);
pro3g = zeros(1,n-1);
g = zeros(1,n-1);

%Calculate entropy
for i = 1:n
    if a(i) == 1
        n1 = n1+1;
    end
    if a(i) == 2
        n2 = n2+1;
    end
    if a(i) == 3
        n3 = n3+1;
    end
    p1 = n1/n;
    p2 = n2/n;
    p3 = n3/n;
     if p1 == 0
            p1 = 1;
        end
        if p2 == 0
            p2 =1;
        end
        if p3 == 0
            p3 = 1;
        end
    ent = -p1*log2(p1)-p2*log2(p2)-p3*log2(p3);
end    
%Calculate information gain
for j = 1:n-1
    for i = 1:n
        if x_attrib(i)<T(j)
            if a(i) == 1
                pro1m(j) = pro1m(j) + 1/n;
            end
            if a(i) == 2
                pro2m(j) = pro2m(j) + 1/n;
            end
            if a(i) == 3
                pro3m(j) = pro3m(j) + 1/n;
            end
        end
        if x_attrib(i)>T(j) || x_attrib(i)==T(j)
             if a(i) == 1
                pro1g(j) = pro1g(j) + 1/n;
            end
            if a(i) == 2
                pro2g(j) = pro2g(j) + 1/n;
            end
            if a(i) == 3
                pro3g(j) = pro3g(j) + 1/n;
            end
        end
    end
        if pro1m(j) == 0
            pro1m(j) = 1;
        end
        if pro2m(j) == 0
            pro2m(j) =1;
        end
        if pro3m(j) == 0
            pro3m(j) = 1;
        end
       if pro1g(j) == 0
            pro1g(j) = 1;
        end
        if pro2g(j) == 0
            pro2g(j) =1;
        end
        if pro3g(j) == 0
            pro3g(j) = 1;
        end
        entm(j) = -pro1m(j)*log2(pro1m(j))-pro2m(j)*log2(pro2m(j))-pro3m(j)*log2(pro3m(j)) ;
        entg(j) = -pro1g(j)*log2(pro1g(j))-pro2g(j)*log2(pro2g(j))-pro3g(j)*log2(pro3g(j)) ; 
        g(j) = ent - mp(j)*entm(j)-gp(j)*entg(j);
end
[GA,p] = max(g);
end