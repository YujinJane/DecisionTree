function [mp,gp,T] = DIV(x_attrib) %Sort out data under the same attribute.
n = length(x_attrib)
minus = zeros(1,n-1);
great = zeros(1,n-1);
%T is the set consisting of candidate sorting points.
T = zeros(1,n-1);
%Rank the original attribution sequence.
x_sort = sort(x_attrib);
for i = 1:n-1
    T(i) = (x_sort(i)+x_sort(i+1))/2;
end

for j = 1:n-1
    for i = 1:n
        if x_attrib(i)<T(j)
            minus(j) = minus(j) + 1;
            %Attribute the factor(data) into minus group.
        end
        if x_attrib(i)>T(j) || x_attrib(i)==T(j)
            great(j) = great(j) + 1;
            %Attribute the factor(data) into great group.
        end
    end
    mp(j) = minus(j)/n;
    %Proportion of minus group into the whole group.
    gp(j) = great(j)/n;
    %Proportion of great group into the whole group.
end
end
            