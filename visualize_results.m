clc
clear
close all

ot_fn_1 = 'optitrack_results/square_270418_124141.xlsx';
ot_fn_2 = 'optitrack_results/square_270418_124802.xlsx';
ot_fn_3 = 'optitrack_results/square_270418_125048.xlsx';
ot_fn_4 = 'optitrack_results/square_270418_125428.xlsx';

vo_fn_1 = 'vo_results/t_124157.txt';
vo_fn_2 = 'vo_results/t_124813.txt';
vo_fn_3 = 'vo_results/t_125102.txt';
vo_fn_4 = 'vo_results/t_125441.txt';

optitrack_filename_pos = ot_fn_1;
vo_filename = vo_fn_1;

[pos_ot, pos_ot_unfiltered] = optitrack_pose(optitrack_filename_pos);
[pos_vo, orientation_vo] = VO_pose(vo_filename);



%% Plotting: Optitrack and VO results together
axis_limit = 1000;

fig_num = 1;
figure(fig_num)
subplot(3,1,1)
hold on
plot(pos_ot(:, 1));
plot(pos_vo(:, 1));
title('Optitrack and VO: x')
legend('x from optitrack', 'x from VO');
grid on
subplot(3,1,2)
hold on
plot(pos_ot(:, 2));
plot(pos_vo(:, 2));
title('Optitrack and VO: y')
legend('y from optitrack', 'y from VO');
grid on
subplot(3,1,3)
hold on
plot(pos_ot(:, 3));
plot(pos_vo(:, 3));
title('Optitrack and VO: z')
legend('z from optitrack', 'z from VO');
grid on

fig_num = fig_num+1;
figure(fig_num)
hold on
scatter(pos_vo(:,1), pos_vo(:, 2) );
scatter(pos_ot(:,1), pos_ot(:, 2) );
axis([-axis_limit axis_limit -axis_limit axis_limit])
grid on
xlabel('x [mm]')
ylabel('y [mm]')
title('[x, y] for VO and optitrack');

fig_num = fig_num+1;
figure(fig_num)
hold on
scatter(pos_vo(:,1), pos_vo(:, 3) );
scatter(pos_ot(:,1), pos_ot(:, 3) );
axis([-axis_limit axis_limit -axis_limit axis_limit])
grid on
xlabel('x [mm]')
ylabel('z [mm]')
title('[x, z] for VO and optitrack');

fig_num = fig_num+1;
figure(fig_num)
hold on
scatter(pos_vo(:,2), pos_vo(:, 3) );
scatter(pos_ot(:, 2), pos_ot(:, 3) );
axis([-axis_limit axis_limit -axis_limit axis_limit])
grid on
xlabel('y [mm]')
ylabel('z [mm]')
title('[y, z] for VO and optitrack');

%% Plotting: Optitrack results
% fig_num = fig_num+1;
% figure(fig_num)
% subplot(3,1,1)
% hold on
% plot(pos_ot_unfiltered(:, 1));
% plot(pos_ot(:, 1));
% legend('x unfiltered', 'x with noise smoothing');
% title('Optitrack: x with and without noise filter')
% grid on
% subplot(3,1,2)
% hold on
% plot(pos_ot_unfiltered(:, 2));
% plot(pos_ot(:, 2));
% legend('y unfiltered', 'y with noise smoothing');
% title('Optitrack: y with and without noise filter')
% grid on
% subplot(3,1,3)
% hold on
% plot(pos_ot_unfiltered(:, 3));
% plot(pos_ot(:, 3));
% legend('z unfiltered', 'z with noise smoothing');
% title('Optitrack: z with and without noise filter')
% grid on
% 
% fig_num = fig_num+1;
% figure(fig_num)
% subplot(3,1,1)
% plot(pos_ot(:, 1));
% title('Optitrack: x with noise filter')
% grid on
% subplot(3,1,2)
% plot(pos_ot(:, 2));
% title('Optitrack: y with noise filter')
% grid on
% subplot(3,1,3)
% plot(pos_ot(:, 3));
% title('Optitrack: z with noise filter')
% grid on

%% Plotting: VO results
% fig_num = fig_num+1;
% figure(fig_num)
% subplot(3,1,1)
% plot(pos_vo(:, 1));
% title('VO: x')
% grid on
% subplot(3,1,2)
% plot(pos_vo(:, 2));
% title('VO: y')
% grid on
% subplot(3,1,3)
% plot(pos_vo(:, 3));
% title('VO: z')
% grid on
% 
% fig_num = fig_num+1;
% figure(fig_num)
% subplot(3,1,1)
% plot(orientation_vo(:, 1));
% title('VO: alpha')
% grid on
% subplot(3,1,2)
% plot(orientation_vo(:, 2));
% title('VO: theta')
% grid on
% subplot(3,1,3)
% plot(orientation_vo(:, 3));
% title('VO: psi')
% grid on