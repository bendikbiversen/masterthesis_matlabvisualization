clear all
clc

% Filling M 3D points from file into a Mx3 array
% 3D points from DUO SDK
fileID = fopen('frame_t1_3D.txt', 'r');
[A, count_sdk] = fscanf(fileID, '%f');
fclose(fileID);

numPoints_sdk = count_sdk/3;
points3d_sdk = zeros(numPoints_sdk, 3);

n = 1;
m = 1;
for i = 1:count_sdk
    points3d_sdk(m, n) = A(i);
    n = n+1;
    if mod(i, 3) == 0
       n = 1; 
       m = m+1;
    end
end

figure(1)
pcshow(points3d_sdk);

% 3D points from OpenCV, cv::reprojectImageTo3D
fileID = fopen('frame_t1_3D_opencv.txt', 'r');
[B, count_cv] = fscanf(fileID, '%f');
fclose(fileID);

numPoints_cv = count_cv/3;
points3d_cv = zeros(numPoints_cv, 3);

n = 1;
m = 1;
for i = 1:count_cv
    points3d_cv(m, n) = B(i);
    n = n+1;
    if mod(i, 3) == 0
       n = 1; 
       m = m+1;
    end
end

figure(2)
pcshow(points3d_cv);

%X = points3d(:, 1);
%Y = points3d(:, 2);
%Z = points3d(:, 3);

%scatter(X, Y, Z);
