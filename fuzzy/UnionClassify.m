function [ result ] = UnionClassify( clusters, classes )
%UNIONCLASSIFY Summary of this function goes here
%   Detailed explanation goes here
class1Count = 0;
class2Count = 0;
for i = 1 : length(classes)
    c = classes(i);
    m = clusters(c.Cluster1Name);
    if m.NumberCat == 1
        class1Count = c.Cluster1Membership;
        class2Count = c.Cluster2Membership;
    else
        class2Count = c.Cluster1Membership;
        class1Count = c.Cluster2Membership;
    end
end

if class1Count > class2Count
    result = 'r';
else 
    result = 'b';
end

end

