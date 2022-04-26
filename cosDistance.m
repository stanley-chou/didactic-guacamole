function [averageDistance] = cosDistance(A)
%Calculates the average Euclidean distance of all the row vectors in A
total = 0;
count = 0;
for i= 1:size(A,1)
    for j = 1:size(A,1)         
        if(i == j)
            continue
        else
            x = A(i,:);
            y = A(j,:);
            curDistance = norm(x-y);
            xy   = dot(x,y);
            nx   = norm(x);
            ny   = norm(y);
            nxny = nx*ny;
            Cs   = xy/nxny;
            count = count+1;
            total = total + Cs;
        end
    end
end
averageDistance = total/count;

end