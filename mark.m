function label = mark(attrib,c)
n = length(attrib);
label = zeros(1,n);
for i = 1:n
    if attrib(i) > c
        label(i) = 1;
    end
    if attrib(i) <=c
        label(i) = 0;
    end
end
    