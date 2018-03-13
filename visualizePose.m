close all
clc
clear all 

t_fileID = fopen('t_matrix_global.txt', 'r');
[tvec, t_count] = fscanf(t_fileID, '%f');
fclose(t_fileID);

num_t = t_count/3;
%num_t = 30;
pos_xyz = zeros(num_t, 3);

n = 1;
m = 1;
for i = 1:t_count
    pos_xyz(m, n) = tvec(i);
    n = n+1;
    if mod(i, 3) == 0
       n = 1; 
       m = m+1;
    end
    if m == num_t
        break
    end
end

figure(1)
hold on
subplot(3,1,1)
plot(pos_xyz(:, 1));
title('x')
grid on
subplot(3,1,2)
plot(pos_xyz(:, 2));
title('y')
grid on
subplot(3,1,3)
plot(pos_xyz(:, 3));
title('z')
grid on

R_fileID = fopen('R_matrix_global.txt', 'r');
[rvec, R_count] = fscanf(R_fileID, '%f');
fclose(R_fileID);

num_R = t_count/3;
orientation = zeros(num_R, 3);

n = 1;
m = 1;
for i = 1:R_count
    orientation(m, n) = rvec(i);
    n = n+1;
    if mod(i, 3) == 0
       n = 1; 
       m = m+1;
    end
    if m == num_R
        break
    end
end

figure(2)
hold on
subplot(3,1,1)
plot(orientation(:, 1));
title('x')
grid on
subplot(3,1,2)
plot(orientation(:, 2));
title('y')
grid on
subplot(3,1,3)
plot(orientation(:, 3));
title('z')
grid on
