clear all
clc

% Filling M 3D points from file into a Mx3 array
fileID = fopen('points3D.txt', 'r');
[A, count] = fscanf(fileID, '%f');
fclose(fileID);

numPoints = count/3;
points3d = zeros(numPoints, 3);

n = 1;
m = 1;
for i = 1:count
    points3d(m, n) = A(i);
    n = n+1;
    if mod(i, 3) == 0
       n = 1; 
       m = m+1;
    end
end

pcshow(points3d);

X = points3d(:, 1);
Y = points3d(:, 2);
Z = points3d(:, 3);

scatter(X, Y, Z);