%% Accumulated translation t_matrix_global
function [pos_xyz, orientation] = VO_pose(vo_filename) 
axis_limit = 1000;

t_fileID = fopen(vo_filename, 'r');
[tvec, t_count] = fscanf(t_fileID, '%f');
fclose(t_fileID);

num_t = t_count/3;
%num_t = 20;
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

t_global_avg = zeros(1, 3);

for i = 1:num_t
    t_global_avg(1) = t_global_avg(1) + pos_xyz(i, 1);
    t_global_avg(2) = t_global_avg(2) + pos_xyz(i, 2);
    t_global_avg(3) = t_global_avg(3) + pos_xyz(i, 3);
end

%t_global_avg = t_global_avg/num_t

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

end %function