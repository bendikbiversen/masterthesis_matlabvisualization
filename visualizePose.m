close all
clc
clear all 

%% Accumulated translation t_matrix_global

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

%% Output translation vector from solvePnP
tpnp_fileID = fopen('tvec_pnp_matrix.txt', 'r');
[tvec_pnp, tpnp_count] = fscanf(tpnp_fileID, '%f');
fclose(tpnp_fileID);

num_tpnp = tpnp_count/3;
%num_t = 30;
t_pnp = zeros(num_tpnp, 3);

n = 1;
m = 1;
for i = 1:tpnp_count
    if tvec_pnp(i)^2 > 1000^2
        t_pnp(m, n) = 0;
    else
        t_pnp(m, n) = tvec_pnp(i);
    end
    n = n+1;
    if mod(i, 3) == 0
       n = 1; 
       m = m+1;
    end
    if m == num_tpnp
        break
    end
end

t_pnp_avg = zeros(1, 3);

for i = 1:num_tpnp
    t_pnp_avg(1) = t_pnp_avg(1) + t_pnp(i, 1);
    t_pnp_avg(2) = t_pnp_avg(2) + t_pnp(i, 2);
    t_pnp_avg(3) = t_pnp_avg(3) + t_pnp(i, 3);
end

t_pnp_avg = t_pnp_avg/num_tpnp

figure(2)
hold on
subplot(3,1,1)
plot(t_pnp(:, 1));
title('tvec pnp.x')
grid on
subplot(3,1,2)
plot(t_pnp(:, 2));
title('tvec pnp.y')
grid on
subplot(3,1,3)
plot(t_pnp(:, 3));
title('tvec pnp.z')
grid on

%% Accumulated orientation R_matrix_global
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

figure(3)
hold on
subplot(3,1,1)
plot(orientation(:, 1));
title('Global orientation: alpha')
grid on
subplot(3,1,2)
plot(orientation(:, 2));
title('Global orientation: theta')
grid on
subplot(3,1,3)
plot(orientation(:, 3));
title('Global orientation: psi')
grid on
