function [pos_local, pos_local_unfiltered] = optitrack_pose(optitrack_filename)

data = xlsread(optitrack_filename);
data = data(:, 1:3);

t_from_global_to_local_frame = zeros(1, 3);
t_from_global_to_local_frame = data(1, :);
data_rows = size(data);
data_rows = data_rows(1);

%want only the rows that are related to the position of the rigid body in the .xlsx-result file
rows_to_skip = 9;
pos_rows = data_rows/rows_to_skip;
% if mod(data_rows, rows_to_skip) == 0
%     pos_rows = data_rows/rows_to_skip;
% else
%     pos_rows = (data_rows-1)/2;
% end

pos_global = zeros(pos_rows, 3);
pos_local = zeros(pos_rows, 3);

for i = 1:pos_rows
    pos_global(i, :) = data(i, :);
    pos_local(i, :) = pos_global(i, :) - t_from_global_to_local_frame(1, :);
    pos_local(i, :) = pos_local(i, :) * 1000; %scale to mm
end

% Noise filter
pos_local_unfiltered = pos_local;

j_x = 0;
j_y = 0;
j_z = 0;
for i = 2:pos_rows
    max_error = 100;
    
    x_diff = (pos_local(i, 1)-pos_local(i-1, 1));
    y_diff = (pos_local(i, 2)-pos_local(i-1, 2));
    z_diff = (pos_local(i, 3)-pos_local(i-1, 3));
    
    if x_diff^2 > max_error^2
        pos_local(i, 1) = pos_local(i-1, 1);
    end
    if y_diff^2 > max_error^2
        j_y = j_y+1;
        pos_local(i, 2) = pos_local(i-1, 2);
    end
    if z_diff^2 > max_error^2
        j_z = j_z+1;
        pos_local(i, 3) = pos_local(i-1, 3);
    end
end

%% For a particular result series! Optitrack tracking started 40 frames before VO tracking
%pos_local = pos_local(40:pos_rows, :);

end